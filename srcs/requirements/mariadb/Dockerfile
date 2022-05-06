FROM debian:buster

RUN apt-get -y update \
    && apt-get -y upgrade \
	&& apt-get -y install wget vim procps mariadb-server
#	RUN apt-get -y install mysql_secure_installation

#COPY ./conf/db.sql /tmp/db.sql
COPY ./conf/db2.sql /tmp/db.sql
COPY ./tools /tmp/tools

EXPOSE 3306

CMD ["/bin/sh", "/tmp/tools/run-mysql.sh"]
ENTRYPOINT ["/usr/bin/mysqld_safe"]
