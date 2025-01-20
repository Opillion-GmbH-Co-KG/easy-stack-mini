#!/usr/bin/env bash

# Wait 60 seconds for SQL Server to start up by ensuring that
# calling SQLCMD does not return an error code, which will ensure that sqlcmd is accessible
# and that system and user databases return "0" which means all databases are in an "online" state
# https://docs.microsoft.com/en-us/sql/relational-databases/system-catalog-views/sys-databases-transact-sql?view=sql-server-2017

WAIT_DB=60
DB_STATUS=1
ERR_CODE=1
i=0

if [[ -f "/tmp/init.done" ]]; then
  exit 0
fi

while [[ ${DB_STATUS} -ne 0 ]] && [[ ${i} -lt ${WAIT_DB} ]] && [[ ${ERR_CODE} -ne 0 ]]; do
	i=${i}+1
	DB_STATUS=$(/opt/mssql-tools/bin/sqlcmd -h -1 -t 1 -U sa -P "${SA_PASSWORD}" -Q "SET NOCOUNT ON; Select SUM(state) from sys.databases")
	ERR_CODE=${?}
	sleep 1
done

if [ "${DB_STATUS}" -ne 0 ] OR [ "${ERR_CODE}" -ne 0 ]; then
	echo "SQL Server took more than ${WAIT_DB} seconds to start up or one or more databases are not in an ONLINE state"
	exit 1
fi

for FILENAME in /usr/init.d/*.sql; do
    [ -e "${FILENAME}" ] || continue
    /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "${SA_PASSWORD}" -d master -i "${FILENAME}"
done

touch /tmp/init.done
