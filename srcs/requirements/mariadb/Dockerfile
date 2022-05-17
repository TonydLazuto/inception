FROM debian:buster

RUN apt-get -y update \
    && apt-get -y upgrade \
	&& apt-get -y install vim procps gettext-base mariadb-server mariadb-client net-tools

# COPY ./conf/*.sql /tmp/
# COPY ./conf/mariadb.cnf /etc/mysql/mariadb.cnf
COPY ./conf/run-mysql.sh /tmp/run-mysql.sh

RUN chmod 755 /tmp/*

RUN sed -i 's/bind-address/\#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN echo "[mysqld]\nskip-networking=0\nskip-bind-address" >> /etc/mysql/mariadb.cnf

EXPOSE 3306
#     show databases;

ENTRYPOINT ["/bin/sh", "-xv", "/tmp/run-mysql.sh"]
CMD ["mysqld"]
