#!/usr/bin/bash

# Move the database's primary data file to MSSQL Server's default data directory location
for i in {1..50};
do
    /usr/bin/mv -f /tmp/wawi_db.mdf /var/opt/mssql/data/wawi_db.mdf
    if [ ${?} -eq 0 ]
    then
        /usr/bin/echo "SUCCESS: move wawi_db.mdf"
        break
    else
        /usr/bin/echo "TRY: move wawi_db.mdf"
        /usr/bin/sleep 1
    fi
done

# Move the database's transaction log file to MSSQL Server's default log directory location
for i in {1..50};
do
    /usr/bin/mv -f /tmp/wawi_db.ldf /var/opt/mssql/data/wawi_db.ldf
    if [ ${?} -eq 0 ]
    then
        /usr/bin/echo "SUCCESS: move wawi_db.ldf"
        break
    else
        /usr/bin/echo "TRY: move wawi_db.ldf"
        /usr/bin/sleep 1
    fi
done

# Execute the "wawi_db.sql" script that restores the database
for i in {1..50};
do
    /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "/tmp/wawi_db.sql"
    if [ ${?} -eq 0 ]
    then
        /usr/bin/echo "SUCCESS: create database wawi_db"
        break
    else
        /usr/bin/echo "TRY: create database wawi_db"
        /usr/bin/sleep 1
    fi
done
