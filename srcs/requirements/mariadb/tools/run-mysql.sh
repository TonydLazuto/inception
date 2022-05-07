#!/bin/sh
# set -e
service mysql start
mysql -u root --skip-password < /tmp/db.sql
# echo /tmp/db.sql
#echo "CREATE DATABASE $DB_NAME;" | mysql -u root --skip-password
#echo "GRANT ALL ON *.* TO $MARIADB_ROOT_HOST@$DOMAIN_NAME IDENTIFIED BY $MARIADB_PASSWORD WITH GRANT OPTION;" | mysql -u root --skip-password
#echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
service mysql stop
exec "$@"

