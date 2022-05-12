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

echo "SET PASSWORD FOR '$MYSQL_USER'@'$DB_HOST' = PASSWORD('$MYSQL_ROOT_PASSWORD');" | mysql -uroot -p

# envsubst < /tmp/db.sql | mysql -uroot -p $MYSQL_ROOT_PASSWORD

# echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" | mysql -u root --skip-password
# echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${MYSQL_USER}'@'${DB_HOST}' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;" | mysql -u root --skip-password
# echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
# echo "CREATE TABLE testtab(id INTEGER AUTO_INCREMENT, name TEXT, PRIMARY KEY (id));" | mysql -u root --skip-password

# echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" | mysql -u root --skip-password
# echo "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'${DB_HOST}' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;" | mysql -u root --skip-password
# echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

service mysql stop
# kill killall mysqld_safe

exec "$@"
