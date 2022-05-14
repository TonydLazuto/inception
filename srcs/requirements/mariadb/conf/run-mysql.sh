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

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
# CREATE USER
echo "CREATE USER '$MYSQL_USER' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "CREATE TABLE $DB_NAME.test(id INTEGER AUTO_INCREMENT, name varchar(255), PRIMARY KEY (id));" | mysql -u$MYSQL_USER -p$MYSQL_PASSWORD
echo "INSERT INTO $DB_NAME.test VALUES (1,'henry');" | mysql -u$MYSQL_USER -p$MYSQL_PASSWORD
echo "INSERT INTO $DB_NAME.test VALUES (2,'titi');" | mysql -u$MYSQL_USER -p$MYSQL_PASSWORD
echo "CREATE USER '$MYSQL_USER2' IDENTIFIED BY '$MYSQL_PASSWORD2';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "GRANT SHOW DATABASES, SELECT ON *.* TO '$MYSQL_USER2';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD

service mysql stop

exec "$@"
