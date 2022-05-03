FROM debian:buster

RUN apt-get -y update 
    RUN apt-get -y upgrade 
	RUN apt-get -y install wget 
	RUN apt-get install -y vim 
    RUN apt-get install -y mariadb-server 
#	RUN apt-get -y install mysql_secure_installation

#COPY ./conf/db.sql /tmp/db.sql
COPY ./conf/db2.sql /tmp/db.sql

	RUN service mysql start && mysql -u root -p < /tmp/db.sql

EXPOSE 3306

CMD ["mysqld_safe"]
