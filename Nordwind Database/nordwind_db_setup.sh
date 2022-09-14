#!/usr/bin/bash

# Move the database's primary data file to MSSQL Server's default data directory location
for i in {1..50};
do
    /usr/bin/mv -f /tmp/nordwind_db.mdf /var/opt/mssql/data/nordwind_db.mdf
    if [ ${?} -eq 0 ]
    then
        /usr/bin/echo "SUCCESS: move nordwind_db.mdf"
        break
    else
        /usr/bin/echo "TRY: move nordwind_db.mdf"
        sleep 1
    fi
done

# Move the database's transaction log file to MSSQL Server's default log directory location
for i in {1..50};
do
    /usr/bin/mv -f /tmp/nordwind_db.ldf /var/opt/mssql/data/nordwind_db.ldf
    if [ ${?} -eq 0 ]
    then
        /usr/bin/echo "SUCCESS: move nordwind_db.ldf"
        break
    else
        /usr/bin/echo "TRY: move nordwind_db.ldf"
        sleep 1
    fi
done

# Execute the "nordwind_db.sql" script that restores the database
for i in {1..50};
do
    /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "/tmp/nordwind_db.sql"
    if [ ${?} -eq 0 ]
    then
        /usr/bin/echo "SUCCESS: create database nordwind_db"
        break
    else
        /usr/bin/echo "TRY: create database nordwind_db"
        sleep 1
    fi
done
