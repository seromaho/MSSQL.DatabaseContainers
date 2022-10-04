# How to use this repository

Use this repository to create SQL database containers w/ **Docker** and complete SQL training assignments.
- each image tag represents a different database running in an **MS SQL Server** container
- either run the following using **PowerShell** ..
```powershell
$containerName = "<INSERT DATABASE NAME HERE>"
$imageName = "mssql_database_containers"
$namespace = "seromaho"
$hostPort = "1433"

# Pull the image from the Docker Hub registry
docker pull "${namespace}/${imageName}:${containerName}"

# Create a writeable container layer over the specified image
# Start the new container
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" -p "${hostPort}:1433" --name "${containerName}" -d "${namespace}/${imageName}:${containerName}"
```
- .. or run the following using **BASH**:
```bash
containerName="<INSERT DATABASE NAME HERE>"
imageName="mssql_database_containers"
namespace="seromaho"
hostPort="1433"

# Pull the image from the Docker Hub registry
docker pull "${namespace}/${imageName}:${containerName}"

# Create a writeable container layer over the specified image
# Start the new container
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" -p "${hostPort}:1433" --name "${containerName}" -d "${namespace}/${imageName}:${containerName}"
```
- the image name is `seromaho/mssql_database_containers:<database name>`
- access the database at `localhost:1433`; MSSQL login name: `SA`; MSSQL SA password: `P@ssw0rd`
- complete the SQL training assignments found in the database's root directory (`assignments.md`) at [MSSQL-Database-Containers](https://github.com/seromaho/MSSQL-Database-Containers)

# Credits

- container images by [seromaho](https://github.com/seromaho)
- databases by [Microsoft](https://github.com/microsoft/sql-server-samples) and [IT-Akademie Dr. Heuer GmbH](https://drheuer.de/)
- SQL training assignments by [IT-Akademie Dr. Heuer GmbH](https://drheuer.de/), modified by [seromaho](https://github.com/seromaho)
