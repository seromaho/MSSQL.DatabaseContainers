#!/usr/bin/bash

# Move the database's primary data file to MSSQL Server's default data directory location
for i in {1..50};
do
    /usr/bin/mv -f /tmp/zoo_db.mdf /var/opt/mssql/data/zoo_db.mdf
    if [ ${?} -eq 0 ]
    then
        /usr/bin/echo "SUCCESS: move zoo_db.mdf"
        break
    else
        /usr/bin/echo "TRY: move zoo_db.mdf"
        sleep 1
    fi
done

# Move the database's transaction log file to MSSQL Server's default log directory location
for i in {1..50};
do
    /usr/bin/mv -f /tmp/zoo_db.ldf /var/opt/mssql/data/zoo_db.ldf
    if [ ${?} -eq 0 ]
    then
        /usr/bin/echo "SUCCESS: move zoo_db.ldf"
        break
    else
        /usr/bin/echo "TRY: move zoo_db.ldf"
        sleep 1
    fi
done

# Execute the "zoo_db.sql" script that restores the database
for i in {1..50};
do
    /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "/tmp/zoo_db.sql"
    if [ ${?} -eq 0 ]
    then
        /usr/bin/echo "SUCCESS: create database zoo_db"
        break
    else
        /usr/bin/echo "TRY: create database zoo_db"
        sleep 1
    fi
done
