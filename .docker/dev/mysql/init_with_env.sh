#!/bin/bash

MYSQL_SERVICE="mysql"
SQL_INPUT_FILE=".docker/dev/mysql/init.sql"
SQL_OUTPUT_FILE=".docker/dev/mysql/init-raw.sql"

if [ -z "$DATABASE_USER" ] || [ -z "$DATABASE_PASSWORD" ]; then
  echo "Environment variables DATABASE_USER or DATABASE_PASSWORD are not set!"
  exit 1
fi

sed -e "s/{{DATABASE_USER}}/${DATABASE_USER}/g" -e "s/{{DATABASE_PASSWORD}}/${DATABASE_PASSWORD}/g" $SQL_INPUT_FILE > $SQL_OUTPUT_FILE
echo "... done!"

tail $SQL_OUTPUT_FILE

