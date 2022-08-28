$localRepoDir = "${HOME}\source\repos"
$dirToMount = "${localRepoDir}\Cheat_Sheet_Repository\SQL\Sample Databases\Microsoft SQL Server\HR Database\Data"
$mountPoint = "/tmp"
$hostPort = "4430"
$containerName = "hr_db"

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" -p "${hostPort}:1433" -v "${dirToMount}:${mountPoint}" --name "${containerName}" -d mcr.microsoft.com/mssql/server:2019-latest


# Using "docker exec" to connect to the container:
for ($i = 0; $i -lt 60; $i++) {
    docker exec "${containerName}" /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "${mountPoint}/${containerName}_schema.sql"
    if ($?) {
        docker exec "${containerName}" /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "${mountPoint}/${containerName}_data.sql"
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
#     sqlcmd -S "tcp:localhost,${hostPort}" -U "SA" -P "P@ssw0rd" -l 30 -i "${dirToMount}\${containerName}_schema.sql"
#     if ($?) {
#         sqlcmd -S "tcp:localhost,${hostPort}" -U "SA" -P "P@ssw0rd" -l 30 -i "${dirToMount}\${containerName}_data.sql"
#         Write-Host "SUCCESS: create database ${containerName}"
#         break
#     }
# if ($i -eq 59) {
#     Write-Host "FAILURE: create database ${containerName}"
#     return
# }
#     Write-Host "TRY: create database ${containerName}"
#     Start-Sleep -Seconds 1
# }
