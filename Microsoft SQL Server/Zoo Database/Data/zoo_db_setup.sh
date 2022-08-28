for i in {1..50};
do
    cp /tmp/zoo_db.mdf /var/opt/mssql/data/zoo_db.mdf
    if [ $? -eq 0 ]
    then
        echo "SUCCESS: copy zoo_db.mdf"
        break
    else
        echo "TRY: copy zoo_db.mdf"
        sleep 1
    fi
done

for i in {1..50};
do
    cp /tmp/zoo_db.ldf /var/opt/mssql/data/zoo_db.ldf
    if [ $? -eq 0 ]
    then
        echo "SUCCESS: copy zoo_db.ldf"
        break
    else
        echo "TRY: copy zoo_db.ldf"
        sleep 1
    fi
done

for i in {1..50};
do
    /usr/bin/chown "mssql" "/var/opt/mssql/data/zoo_db.mdf"
    if [ $? -eq 0 ]
    then
        break
    else
        echo "TRY: fix /var/opt/mssql/data/zoo_db.mdf"
        sleep 1
    fi
done

for i in {1..50};
do
        /usr/bin/chown "mssql" "/var/opt/mssql/data/zoo_db.ldf"
    if [ $? -eq 0 ]
    then
        break
    else
        echo "TRY: fix /var/opt/mssql/data/zoo_db.ldf"
        sleep 1
    fi
done

for i in {1..50};
do
    /usr/bin/chown "mssql" "/tmp/zoo_db.sql"
    if [ $? -eq 0 ]
    then
        break
    else
        echo "TRY: fix /var/opt/mssql/data/zoo_db.sql"
        sleep 1
    fi
done

for i in {1..50};
do
    /usr/bin/chmod 640 "/var/opt/mssql/data/zoo_db.mdf"
    if [ $? -eq 0 ]
    then
        echo "SUCCESS: fix zoo_db.mdf"
        break
    else
        echo "TRY: fix /var/opt/mssql/data/zoo_db.mdf"
        sleep 1
    fi
done

for i in {1..50};
do
    /usr/bin/chmod 640 "/var/opt/mssql/data/zoo_db.ldf"
    if [ $? -eq 0 ]
    then
        echo "SUCCESS: fix zoo_db.ldf"
        break
    else
        echo "TRY: fix /var/opt/mssql/data/zoo_db.ldf"
        sleep 1
    fi
done

for i in {1..50};
do
    /usr/bin/chmod 740 "/tmp/zoo_db.sql"
    if [ $? -eq 0 ]
    then
        echo "SUCCESS: fix zoo_db.sql"
        break
    else
        echo "TRY: fix /var/opt/mssql/data/zoo_db.sql"
        sleep 1
    fi
done

# for i in {1..50};
# do
#     /usr/bin/su --login "mssql"
#     if [ $? -eq 0 ]
#     then
#         echo "SUCCESS: fix user privileges"
#         break
#     else
#         echo "TRY: fix user privileges"
#         sleep 1
#     fi
# done

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
