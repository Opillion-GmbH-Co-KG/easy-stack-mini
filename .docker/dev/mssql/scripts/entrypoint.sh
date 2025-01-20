#!/bin/bash

/usr/sbin/configure-db.sh &
/opt/mssql/bin/sqlservr
