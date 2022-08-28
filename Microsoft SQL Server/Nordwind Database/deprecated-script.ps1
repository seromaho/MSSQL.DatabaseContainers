# DOESN'T WORK
# Database 'Nordwind_DB' cannot be upgraded because it is read-only, has read-only files or the user does not have permissions to modify some of the files.
# Make the database or files writeable, and rerun recovery.

$localRepoDir = $($HOME + "\source\repos")
$dirToMount = $($localRepoDir + "\Cheat_Sheet_Repository\SQL\Sample Databases\Microsoft SQL Server\Nordwind Database\Data")
$mountPoint = "/var/opt/mssql/data"
$containerName = "nordwind_db"

# # Create an MS-SQL Server container using the database data directory from the host repository as a data volume:
# docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" -p 4433:1433 -v "${dirToMount}:${mountPoint}" --name "${containerName}" -d mcr.microsoft.com/mssql/server:2019-latest
# # Changes made to database and to database data will be persistent.

# Create an MS-SQL Server container and copy the database data files from the host repository into the container's filesystem:
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" -p 4433:1433 --name ${containerName} -d mcr.microsoft.com/mssql/server:2019-latest
Start-Sleep -Seconds 10
docker cp "${dirToMount}\${containerName}.mdf" "${containerName}:${mountPoint}"
docker cp "${dirToMount}\${containerName}.ldf" "${containerName}:${mountPoint}"
docker cp "${dirToMount}\${containerName}.sql" "${containerName}:${mountPoint}"
# # Changes made to database and to database data will not be persistent, but container-specific.

docker exec -u "root" "${containerName}" /usr/bin/chown "mssql" "${mountPoint}/${containerName}.mdf"
docker exec -u "root" "${containerName}" /usr/bin/chown "mssql" "${mountPoint}/${containerName}.ldf"
docker exec -u "root" "${containerName}" /usr/bin/chown "mssql" "${mountPoint}/${containerName}.sql"

docker exec -u "root" "${containerName}" /usr/bin/chmod 640 "${mountPoint}/${containerName}.mdf"
docker exec -u "root" "${containerName}" /usr/bin/chmod 640 "${mountPoint}/${containerName}.ldf"
docker exec -u "root" "${containerName}" /usr/bin/chmod 740 "${mountPoint}/${containerName}.sql"

# Using "docker exec" to connect to the container:
docker exec "${containerName}" /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "${mountPoint}/${containerName}.sql"

# # Using "sqlcmd" (running on the host machine) to connect to the container:
# sqlcmd -S "tcp:localhost,4433" -U "SA" -P "P@ssw0rd" -l 30 -i "${dirToMount}\${containerName}.sql"
