for i in {1..50};
do
    mv -f /tmp/zoo_db.mdf /var/opt/mssql/data/zoo_db.mdf
    if [ $? -eq 0 ]
    then
        echo "SUCCESS: move zoo_db.mdf"
        break
    else
        echo "TRY: move zoo_db.mdf"
        sleep 1
    fi
done

for i in {1..50};
do
    mv -f /tmp/zoo_db.ldf /var/opt/mssql/data/zoo_db.ldf
    if [ $? -eq 0 ]
    then
        echo "SUCCESS: move zoo_db.ldf"
        break
    else
        echo "TRY: move zoo_db.ldf"
        sleep 1
    fi
done

for i in {1..50};
do
    /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "/tmp/zoo_db.sql"
    if [ $? -eq 0 ]
    then
        echo "SUCCESS: create database zoo_db"
        break
    else
        echo "TRY: create database zoo_db"
        sleep 1
    fi
done
