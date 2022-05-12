FROM debian:buster

RUN apt-get -y update \
    && apt-get -y upgrade \
	&& apt-get -y install vim procps gettext-base mariadb-server

COPY ./conf/db2.sql /tmp/db.sql
# COPY ./conf/mariadb.cnf /etc/mysql/mariadb.cnf
COPY ./conf/run-mysql.sh /tmp/run-mysql.sh

RUN chmod 755 /tmp/*

EXPOSE 3306
#     show databases;

ENTRYPOINT ["/bin/sh", "-xv", "/tmp/run-mysql.sh"]
CMD ["/usr/bin/mysqld_safe"]
