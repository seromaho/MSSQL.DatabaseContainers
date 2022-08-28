$localRepoDir = "${HOME}\source\repos"

Set-Location -Path "${localRepoDir}\Cheat_Sheet_Repository\SQL\Sample Databases\Microsoft SQL Server\Northwind Database\Multi-Container Application"
# docker --context "default" compose up -d
docker --context "default" compose up
