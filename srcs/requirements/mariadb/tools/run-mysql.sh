#!/bin/sh

#mysql -u root --skip-password < /tmp/db.sql
service mysql start
echo "CREATE DATABASE $MARIADB_DATABASE;" | mysql -u root --skip-password
echo "GRANT ALL ON *.* TO $MARIADB_ROOT_HOST@$DB_HOST IDENTIFIED BY $MARIADB_PASSWORD WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
service mysql stop
exec "$@"

