for i in {1..50};
do
    /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "/tmp/northwind_db.sql"
    if [ $? -eq 0 ]
    then
        echo "SUCCESS: create database northwind_db"
        break
    else
        echo "TRY: create database northwind_db"
        sleep 1
    fi
done
