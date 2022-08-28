$localRepoDir = "${HOME}\source\repos"
$dirToMount = "${localRepoDir}\Cheat_Sheet_Repository\SQL\Sample Databases\Microsoft SQL Server\Movies Database\Data"
$mountPoint = "/var/opt/mssql/data"
$publishedPort = "4433"
$containerName = "movies_db"

# # Create an MS-SQL Server container using the database data directory from the host repository as a data volume:
# docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" -p "${publishedPort}:1433" -v "${dirToMount}:${mountPoint}" --name "${containerName}" -d mcr.microsoft.com/mssql/server:2019-latest
# # Changes made to database and to database data will be persistent.

# Create an MS-SQL Server container and copy the database data files from the host repository into the container's filesystem:
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" -p "${publishedPort}:1433" --name ${containerName} -d mcr.microsoft.com/mssql/server:2019-latest
for ($i = 0; $i -lt 60; $i++) {
    docker cp "${dirToMount}\${containerName}.mdf" "${containerName}:${mountPoint}/"
    if ($?) {
        Write-Host "SUCCESS: copy ${containerName}.mdf to ${containerName}:${mountPoint}"
        docker cp "${dirToMount}\${containerName}.ldf" "${containerName}:${mountPoint}/"
        Write-Host "SUCCESS: copy ${containerName}.ldf to ${containerName}:${mountPoint}"
        docker cp "${dirToMount}\${containerName}.sql" "${containerName}:${mountPoint}/"
        Write-Host "SUCCESS: copy ${containerName}.sql to ${containerName}:${mountPoint}"
        break
    }
    if ($i -eq 59) {
        Write-Host "FAILURE: create database ${containerName}"
        return
    }
    Write-Host "TRY: copy database data"
    Start-Sleep -Seconds 1
}
# Changes made to database and to database data will not be persistent, but container-specific.

for ($i = 0; $i -lt 60; $i++) {
    docker exec -u "root" "${containerName}" /usr/bin/chown "mssql" "${mountPoint}/${containerName}.mdf"
    if ($?) {
        docker exec -u "root" "${containerName}" /usr/bin/chown "mssql" "${mountPoint}/${containerName}.ldf"
        docker exec -u "root" "${containerName}" /usr/bin/chown "mssql" "${mountPoint}/${containerName}.sql"
        break
    }
    if ($i -eq 59) {
        Write-Host "FAILURE: create database ${containerName}"
        return
    }
    Write-Host "TRY: prepare database files"
    Start-Sleep -Seconds 1
}

for ($i = 0; $i -lt 60; $i++) {
    docker exec -u "root" "${containerName}" /usr/bin/chmod 640 "${mountPoint}/${containerName}.mdf"
    # docker exec -u "root" "${containerName}" /usr/bin/chmod 777 "${mountPoint}/${containerName}.mdf"
    if ($?) {
        Write-Host "SUCCESS: prepare ${mountPoint}/${containerName}.mdf"
        docker exec -u "root" "${containerName}" /usr/bin/chmod 640 "${mountPoint}/${containerName}.ldf"
        # docker exec -u "root" "${containerName}" /usr/bin/chmod 777 "${mountPoint}/${containerName}.ldf"
        Write-Host "SUCCESS: prepare ${mountPoint}/${containerName}.ldf"
        docker exec -u "root" "${containerName}" /usr/bin/chmod 740 "${mountPoint}/${containerName}.sql"
        Write-Host "SUCCESS: prepare ${mountPoint}/${containerName}.sql"
        break
    }
    if ($i -eq 59) {
        Write-Host "FAILURE: create database ${containerName}"
        return
    }
    Write-Host "TRY: prepare database files"
    Start-Sleep -Seconds 1
}

# Using "docker exec" to connect to the container:
for ($i = 0; $i -lt 60; $i++) {
    docker exec "${containerName}" /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "${mountPoint}/${containerName}.sql"
    if ($?) {
        Write-Host "SUCCESS: create database ${containerName}"
        break
    }
    if ($i -eq 59) {
        Write-Host "FAILURE: create database ${containerName}"
        return
    }
    Write-Host "TRY: create database ${containerName}"
    Start-Sleep -Seconds 1
}

# # Using "sqlcmd" (running on the host machine) to connect to the container:
# for ($i = 0; $i -lt 60; $i++) {
#     sqlcmd -S "tcp:localhost,${publishedPort}" -U "SA" -P "P@ssw0rd" -l 30 -i "${dirToMount}\${containerName}.sql"
#     if ($?) {
#         Write-Host "SUCCESS: create ${containerName}"
#         break
#     }
# if ($i -eq 59) {
#     Write-Host "FAILURE: create database ${containerName}"
#     return
# }
#     Write-Host "TRY: create database ${containerName}"
#     Start-Sleep -Seconds 1
# }
