$localRepoDir = "${HOME}\source\repos"
$dirToMount = "${localRepoDir}\Cheat_Sheet_Repository\SQL\Sample Databases\Microsoft SQL Server\TeachSQL Database\Data"
$mountPoint = "/tmp"
$hostPort = "4430"
$containerName = "teachsql_db"

docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" -p "${hostPort}:1433" -v "${dirToMount}:${mountPoint}" --name "${containerName}" -d mcr.microsoft.com/mssql/server:2019-latest


# Using "docker exec" to connect to the container:
for ($i = 0; $i -lt 60; $i++) {
    docker exec "${containerName}" /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "${mountPoint}/teachsql_container.sql"
    if ($?) {
        docker exec "${containerName}" /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "${mountPoint}/teachsql_course_attendee_courseattendence.sql"
        docker exec "${containerName}" /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "${mountPoint}/teachsql_device_vendor.sql"
        docker exec "${containerName}" /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "${mountPoint}/teachsql_dhcplog.sql"
        docker exec "${containerName}" /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "${mountPoint}/teachsql_mov_person_mov_film_mov_besetzung.sql"
        docker exec "${containerName}" /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "${mountPoint}/teachsql_oxfordweather.sql"
        docker exec "${containerName}" /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "${mountPoint}/teachsql_pro_ang.sql"
        # Keyword or statement option 'CODEPAGE' is not supported on the 'Linux' platform.
        docker exec "${containerName}" /opt/mssql-tools/bin/sqlcmd -U "SA" -P "P@ssw0rd" -l 30 -i "${mountPoint}/teachsql_blztabelle.sql"
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
#     sqlcmd -S "tcp:localhost,${hostPort}" -U "SA" -P "P@ssw0rd" -l 30 -i "${dirToMount}\teachsql_container.sql"
#     if ($?) {
#         sqlcmd -S "tcp:localhost,${hostPort}" -U "SA" -P "P@ssw0rd" -l 30 -i "${dirToMount}\teachsql_course_attendee_courseattendence.sql"
#         sqlcmd -S "tcp:localhost,${hostPort}" -U "SA" -P "P@ssw0rd" -l 30 -i "${dirToMount}\teachsql_device_vendor.sql"
#         sqlcmd -S "tcp:localhost,${hostPort}" -U "SA" -P "P@ssw0rd" -l 30 -i "${dirToMount}\teachsql_dhcplog.sql"
#         sqlcmd -S "tcp:localhost,${hostPort}" -U "SA" -P "P@ssw0rd" -l 30 -i "${dirToMount}\teachsql_mov_person_mov_film_mov_besetzung.sql"
#         sqlcmd -S "tcp:localhost,${hostPort}" -U "SA" -P "P@ssw0rd" -l 30 -i "${dirToMount}\teachsql_oxfordweather.sql"
#         sqlcmd -S "tcp:localhost,${hostPort}" -U "SA" -P "P@ssw0rd" -l 30 -i "${dirToMount}\teachsql_pro_ang.sql"
#         # Keyword or statement option 'CODEPAGE' is not supported on the 'Linux' platform.
#         sqlcmd -S "tcp:localhost,${hostPort}" -U "SA" -P "P@ssw0rd" -l 30 -i "${dirToMount}\teachsql_blztabelle.sql"
#         Write-Host "SUCCESS: create database ${containerName}"
#         break
#     }
#     if ($i -eq 59) {
#         Write-Host "FAILURE: create database ${containerName}"
#         return
#     }
#     Write-Host "TRY: create database ${containerName}"
#     Start-Sleep -Seconds 1
# }
