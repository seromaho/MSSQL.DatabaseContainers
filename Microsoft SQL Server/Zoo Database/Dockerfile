FROM mcr.microsoft.com/mssql/server:2019-latest

USER mssql

# COPY --chown=mssql .\Data /var/opt/mssql/data/

COPY --chown=mssql * /tmp/

# RUN ["/usr/bin/chmod", "640", "/var/opt/mssql/data/zoo_db.mdf"]
# RUN ["/usr/bin/chmod", "640", "/var/opt/mssql/data/zoo_db.ldf"]
# RUN ["/usr/bin/chmod", "740", "/var/opt/mssql/data/zoo_db.sql"]

RUN ["/usr/bin/chmod", "740", "/tmp/container_setup.sh"]
RUN ["/usr/bin/chmod", "740", "/tmp/zoo_db_setup.sh"]
RUN ["/usr/bin/chmod", "640", "/tmp/zoo_db.mdf"]
RUN ["/usr/bin/chmod", "640", "/tmp/zoo_db.ldf"]
RUN ["/usr/bin/chmod", "740", "/tmp/zoo_db.sql"]

CMD ["/tmp/container_setup.sh"]
