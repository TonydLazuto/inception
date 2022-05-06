FROM debian:buster

RUN apt-get -y update \
    && apt-get -y upgrade \
	&& apt-get -y install wget vim procps mariadb-server
#	RUN apt-get -y install mysql_secure_installation

#COPY ./conf/db.sql /tmp/db.sql
COPY ./conf/db2.sql /tmp/db.sql

EXPOSE 3306

ENTRYPOINT ["/bin/sh", "tools/run-mysql.sh"]
CMD ["mysqld_safe"]
