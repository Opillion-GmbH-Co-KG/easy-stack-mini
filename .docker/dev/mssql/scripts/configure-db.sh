#!/bin/bash
DB_STATUS=1
ERR_CODE=1
i=0
LOOP_COUNT=0
LOOP_CONDITION=1

if [[ -f "/tmp/init.done" ]]; then
  exit 0
fi

echo "[entrypoint SQL] Waiting 20s for DB to start..."
sleep 20
echo "[entrypoint SQL] Trying to connect to DB prior to start imports"

while [[ ${DB_STATUS} -ne 0 ]] && [[ ${i} -lt 60 ]] && [[ ${ERR_CODE} -ne 0 ]]; do
    i=$((i+1))
    DB_STATUS=$(/opt/mssql-tools18/bin/sqlcmd -h -1 -t 1 -U sa -P "${SA_PASSWORD}" -Q "SET NOCOUNT ON; Select SUM(state) from sys.databases" -C)
    ERR_CODE=${?}

    if [[ -z "$DB_STATUS" ]]; then
        DB_STATUS=1
    fi

    sleep 1
done

if [[ "${DB_STATUS}" -ne 0 ]] || [[ "${ERR_CODE}" -ne 0 ]]; then
    echo "SQL Server took more than 60 seconds to start up or one or more databases are not in an ONLINE state"
    exit 1
fi

while [ ${LOOP_CONDITION} -eq 1 ]; do
    if [ ${LOOP_COUNT} -lt 20 ]; then
        LOOP_COUNT=$((LOOP_COUNT+1))

        DB_STATUS=$(/opt/mssql-tools18/bin/sqlcmd -h -1 -t 1 -U sa -P "$SA_PASSWORD" -Q "SET NOCOUNT ON; Select SUM(state) from sys.databases" -C)
        ERR_CODE=$?

        if [[ -z "$DB_STATUS" ]]; then
            DB_STATUS=1
        fi

        echo "[entrypoint SQL] Loop ${LOOP_COUNT}: DB status ${DB_STATUS} / Error code ${ERR_CODE} (0 means OK)"
    else
        echo "[entrypoint SQL] Tried 20 times - Imports aborted"
        exit 1
    fi

    if [ ${DB_STATUS} -eq 0 ] && [ ${ERR_CODE} -eq 0 ]; then
        LOOP_CONDITION=0
        echo "DB is up - starting import"
    else
        echo "[entrypoint SQL] Wait another 10s"
        sleep 10
    fi
done

for FILENAME in /usr/init.d/*.sql; do
    [ -e "${FILENAME}" ] || continue
    /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "${SA_PASSWORD}" -d master -i "${FILENAME}" -C
    echo "[entrypoint SQL] Importing file ${FILENAME} done!"
done

touch /tmp/init.done
