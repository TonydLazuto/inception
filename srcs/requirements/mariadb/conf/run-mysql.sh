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

# service mysql start

echo "CREATE USER '$MYSQL_USER'@'$MYSQL_DATABASE' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'$MYSQL_DATABASE';" | mysql -u$MYSQL_USER -p$MYSQL_PASSWORD
echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" | mysql -u$MYSQL_USER -p$MYSQL_PASSWORD
echo "FLUSH PRIVILEGES;" | mysql -u$MYSQL_USER -p$MYSQL_PASSWORD

# echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
# echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'${DB_HOST}' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
# echo "CREATE TABLE testtab(id INTEGER AUTO_INCREMENT, name TEXT, PRIMARY KEY (id));" | mysql -uroot -p$MYSQL_ROOT_PASSWORD# echo "FLUSH PRIVILEGES;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD

# service mysql stop

exec "$@"
