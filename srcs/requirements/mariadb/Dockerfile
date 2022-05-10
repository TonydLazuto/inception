FROM debian:buster

RUN apt-get -y update \
    && apt-get -y upgrade \
	&& apt-get -y install vim procps mariadb-server

COPY ./conf/db2.sql /tmp/db.sql
# COPY ./conf/mariadb.cnf /etc/sql/mariadb.cnf
COPY ./tools/run-mysql.sh /tmp/run-mysql.sh

EXPOSE 3306

ENTRYPOINT ["/bin/sh", "/tmp/run-mysql.sh"]
CMD ["/usr/bin/mysqld_safe"]
