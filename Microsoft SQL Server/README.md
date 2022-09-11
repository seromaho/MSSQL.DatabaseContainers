# How to use this repository

1. install and run [Docker](https://www.docker.com/) on your local machine
2. clone the database's root directory (the directory containing the `Dockerfile`) to your local machine
3. navigate into the cloned root directory
4. execute the contained PowerShell script (the `.ps1` file)
   The PowerShell script will build the `database image` from the `Dockerfile`, using `mcr.microsoft.com/mssql/server:2019-latest` as the base image.
   The image name will be `mssql/<database name>`.
   The PowerShell script will create a writeable container layer over the database image and then start the new container.
- access the database at `localhost:1433`; MSSQL login name: `SA`; MSSQL SA password: `P@ssw0rd`
5. complete the SQL training assignments found in the database's root directory (`assignments.md`)
