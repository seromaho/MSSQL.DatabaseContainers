# Set the Base Image for subsequent instructions
FROM mcr.microsoft.com/mssql/server:2019-latest

# Set the user name to use as the default user and group for the remainder of the current stage
# The specified user is used for RUN instructions and at runtime, runs the relevant ENTRYPOINT and CMD commands
USER mssql

# Add all files from docker build context
COPY --chown=mssql * /tmp/

# The RUN instruction will execute any commands in a new layer on top of the current image and commit the results
# The resulting committed image will be used for the next step in the Dockerfile
RUN ["/usr/bin/chmod", "740", "/tmp/container_setup.sh"]
RUN ["/usr/bin/chmod", "740", "/tmp/zoo_db_setup.sh"]
RUN ["/usr/bin/chmod", "640", "/tmp/zoo_db.mdf"]
RUN ["/usr/bin/chmod", "640", "/tmp/zoo_db.ldf"]
RUN ["/usr/bin/chmod", "740", "/tmp/zoo_db.sql"]
# In this case, the modes of the listed files are changed

# The main purpose of a CMD is to provide defaults for an executing container
# CMD does not execute anything at build time, but specifies the intended command for the image
CMD ["/tmp/container_setup.sh"]
