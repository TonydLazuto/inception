#!/bin/sh

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "FLUSH PRIVILEGES;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD 

mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown

exec "$@"
