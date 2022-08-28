# How to use this repository

## SINGLE-CONTAINER DATABASE
Create a database as a single Docker container:
1. install and run [Docker](https://www.docker.com/) on your local machine
2. clone the database's root directory (that contains the `Data`, `Image`, `Multi-Container Application`, and `Single-Container Database` directories) to your local machine
3. navigate into the `Single-Container Database` directory
4. execute the contained PowerShell script (the `.ps1` file)
- access the database at `localhost:${hostPort}`; MSSQL login name: `SA`; MSSQL SA password: `P@ssw0rd`
5. complete the SQL training assignments found in the database's root directory (`assignments.md`)

## MULTI-CONTAINER APPLICATION
Create a database as part of a multi-container application:
1. install and run [Docker](https://www.docker.com/) on your local machine
2. clone the database's root directory (that contains the `Data`, `Image`, `Multi-Container Application`, and `Single-Container Database` directories) to your local machine
3. navigate into the `Multi-Container Application` directory
- `optionally` modify the contained Docker Compose file (`docker-compose.yaml` or `docker-compose.yml`) to include the additional containers you need
4. execute the contained PowerShell script (the `.ps1` file)
- `optionally` modify the created Docker network to include the additional containers you need
- access the database at `localhost:${hostPort}`; MSSQL login name: `SA`; MSSQL SA password: `P@ssw0rd`
5. complete the SQL training assignments found in the database's root directory (`assignments.md`)

## IMAGE
Create a Docker container image for the database:
1. install and run [Docker](https://www.docker.com/) on your local machine
