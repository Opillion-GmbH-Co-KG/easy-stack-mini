#!/bin/bash
set -euo pipefail

# Load MySQL root password from file if available
if [ -n "${MYSQL_ROOT_PASSWORD_FILE:-}" ] && [ -f "$MYSQL_ROOT_PASSWORD_FILE" ]; then
    MYSQL_ROOT_PASSWORD=$(cat "$MYSQL_ROOT_PASSWORD_FILE")
    export MYSQL_ROOT_PASSWORD
fi

# Load database password from file if available
if [ -n "${DATABASE_PASSWORD_FILE:-}" ] && [ -f "$DATABASE_PASSWORD_FILE" ]; then
    DATABASE_PASSWORD=$(cat "$DATABASE_PASSWORD_FILE")
    export DATABASE_PASSWORD
fi

# Function to check and load environment variables from secrets
check_env() {
    local env_var="$1"
    local secret_file="/run/secrets/secret_$env_var"
    if [ -z "${!env_var:-}" ]; then
        if [ -f "$secret_file" ]; then
            value=$(cat "$secret_file")
            export "$env_var"="$value"
            echo "Loaded $env_var from secret: $secret_file."
        else
            echo "Environment variable $env_var is not set and no secret was found at $secret_file." >&2
            exit 1
        fi
    else
        echo "Environment variable $env_var is already set to '${!env_var}'"
    fi
}

# Check required environment variables
check_env "DATABASE_USER"
check_env "DATABASE_PASSWORD"
check_env "MYSQL_ROOT_PASSWORD"
check_env "DATABASE_NAME"

# Debug: Print environment variables
echo "Environment Variables:"
echo "DATABASE_USER: $DATABASE_USER"
echo "DATABASE_PASSWORD: $DATABASE_PASSWORD"
echo "MYSQL_ROOT_PASSWORD: $MYSQL_ROOT_PASSWORD"
echo "DATABASE_NAME: $DATABASE_NAME"

# Display init file for debugging
if [ -f /etc/mysql/init-raw.sql ]; then
    echo "Starting MySQL initialization with init file: /etc/mysql/init-raw.sql"
    cat /etc/mysql/init-raw.sql
else
    echo "Initialization file /etc/mysql/init-raw.sql not found!" >&2
    exit 1
fi

# Initialize MySQL database
echo "Running MySQL initialization..."
if mysqld --init-file=/etc/mysql/init-raw.sql --user=mysql --initialize; then
    echo "MySQL initialization completed successfully."
else
    echo "MySQL initialization failed!" >&2
    exit 1
fi

# Start MySQL server
echo "Starting MySQL server as user: $DATABASE_USER"
if mysqld --user="$DATABASE_USER"; then
    echo "MySQL server started successfully."
else
    echo "MySQL server failed to start!" >&2
    exit 1
fi
