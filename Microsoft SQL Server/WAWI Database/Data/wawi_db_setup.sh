for i in {1..50};
do
    cp /tmp/wawi_db.mdf /var/opt/mssql/data/wawi_db.mdf
    if [ $? -eq 0 ]
    then
        echo "SUCCESS: copy wawi_db.mdf"
        break
    else
        echo "TRY: copy wawi_db.mdf"
        sleep 1
    fi
done

for i in {1..50};
do
    cp /tmp/wawi_db.ldf /var/opt/mssql/data/wawi_db.ldf
    if [ $? -eq 0 ]
    then
        echo "SUCCESS: copy wawi_db.ldf"
        break
    else
        echo "TRY: copy wawi_db.ldf"
        sleep 1
    fi
done

for i in {1..50};
do
    /usr/bin/chown "mssql" "/var/opt/mssql/data/wawi_db.mdf"
    if [ $? -eq 0 ]
    then
        break
    else
        echo "TRY: fix /var/opt/mssql/data/wawi_db.mdf"
        sleep 1
    fi
done

for i in {1..50};
do
        /usr/bin/chown "mssql" "/var/opt/mssql/data/wawi_db.ldf"
    if [ $? -eq 0 ]
    then
        break
    else
        echo "TRY: fix /var/opt/mssql/data/wawi_db.ldf"
        sleep 1
    fi
done

for i in {1..50};
do
    /usr/bin/chown "mssql" "/tmp/wawi_db.sql"
    if [ $? -eq 0 ]
    then
        break
    else
        echo "TRY: fix /var/opt/mssql/data/wawi_db.sql"
        sleep 1
    fi
done

for i in {1..50};
do
    /usr/bin/chmod 640 "/var/opt/mssql/data/wawi_db.mdf"
    if [ $? -eq 0 ]
    then
        echo "SUCCESS: fix wawi_db.mdf"
        break
    else
        echo "TRY: fix /var/opt/mssql/data/wawi_db.mdf"
        sleep 1
    fi
done

for i in {1..50};
do
    /usr/bin/chmod 640 "/var/opt/mssql/data/wawi_db.ldf"
    if [ $? -eq 0 ]
    then
        echo "SUCCESS: fix wawi_db.ldf"
        break
    else
        echo "TRY: fix /var/opt/mssql/data/wawi_db.ldf"
        sleep 1
    fi
done

for i in {1..50};
do
    /usr/bin/chmod 740 "/tmp/wawi_db.sql"
    if [ $? -eq 0 ]
    then
        echo "SUCCESS: fix wawi_db.sql"
        break
    else
        echo "TRY: fix /var/opt/mssql/data/wawi_db.sql"
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
    /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "/tmp/wawi_db.sql"
    if [ $? -eq 0 ]
    then
        echo "SUCCESS: create database wawi_db"
        break
    else
        echo "TRY: create database wawi_db"
        sleep 1
    fi
done
