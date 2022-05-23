FROM debian:buster

RUN apt-get -y update \
    && apt-get -y upgrade \
	&& apt-get -y install vim procps mariadb-server mariadb-client net-tools

COPY ./conf/run-mysql.sh /tmp/run-mysql.sh

RUN chmod 755 /tmp/*

# RUN sed -i 's/bind-address/\#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN echo "[mysqld]\nbind-address = 0.0.0.0\nport = 3306\nconnect_timeout = 20" >> /etc/mysql/mariadb.cnf

RUN sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf \
    && sed -i 's/\#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# EXPOSE 3306

ENTRYPOINT ["/bin/sh", "-xv", "/tmp/run-mysql.sh"]
CMD ["mysqld"]
