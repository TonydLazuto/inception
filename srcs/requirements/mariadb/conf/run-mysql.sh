#!/bin/sh

# man grep
# -F, --fixed-strings
#     Interpret PATTERN as a list of fixed strings,
#     separated by newlines, any of which is to be matched.
# -x, --line-regexp
#     Select only those matches that exactly match the whole line.
# -q, --quiet, --silent
#     Quiet; do not write anything to standard output.
#     Exit immediately with zero status if any match is found,
#     even if an error was detected. Also see the -s or --no-messages option.

# if grep -Fxq "[mysqld]"; then
#     sed '/^[mysqld]/a skip-grant-tables' /etc/mysql/my.cnf
# else
#     echo "[mysqld]\nskip-grant-tables" >> /etc/mysql/my.cnf
# fi


sed -i 's/bind-address/\#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start


until mysqladmin --host=$DB_HOST --user=$MYSQL_USER --skip-password ping; do
	sleep 2s
done

echo "ALTER USER '$MYSQL_USER'@'$DB_HOST' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -uroot --skip-password
# until mysqladmin --host=$DB_HOST --user=$MYSQL_USER --password=$MYSQL_ROOT_PASSWORD ping \
#     && mariadb --host=$DB_HOST --user=$MYSQL_USER --password=$MYSQL_ROOT_PASSWORD -e "SHOW DATABASES;" | grep $DB_NAME; do
# 	sleep 2s
# done

mysql -u root --skip-password < /tmp/db.sql 
#envsubst
# mysql -u root --skip-password << EOSQL
# CREATE DATABASE IF NOT EXISTS ${DB_NAME};
# GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${MYSQL_USER}'@'${DB_HOST}' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;
# FLUSH PRIVILEGES;
# CREATE TABLE testtab(id INTEGER AUTO_INCREMENT, name TEXT, PRIMARY KEY (id));
# EOSQL

# echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" | mysql -u root --skip-password
# echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'${DB_HOST}' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;" | mysql -u root --skip-password
# echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

service mysql stop
# kill killall mysqld_safe

exec "$@"
