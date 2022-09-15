$context = "."
$containerName = "wawi_db"
$baseImage = "server-2019-latest"
$hostPort = "1433"

# Build an image from the Dockerfile
docker build -f "Dockerfile" -t "mssql/${containerName}:${baseImage}" "${context}"

# Create a writeable container layer over the specified image
# Start the new container
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=P@ssw0rd" -p "${hostPort}:1433" --name "${containerName}" -d "mssql/${containerName}:${baseImage}"
