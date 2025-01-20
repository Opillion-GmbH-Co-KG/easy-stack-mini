#!/usr/bin/env bash

/usr/scripts/configure-db.sh &
/opt/mssql/bin/sqlservr
