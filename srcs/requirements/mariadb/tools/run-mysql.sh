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

if grep -Fxq "[mysqld]"; then
    sed '/^[mysqld]/a skip-grant-tables' /etc/mysql/my.cnf
else
    echo "[mysqld]\nskip-grant-tables" >> /etc/mysql/my.cnf
fi

mysqld_safe
# mysql -u root --skip-password < /tmp/db.sql
# echo /tmp/db.sql
# echo "CREATE DATABASE $MYSQL_DATABASE;" | mysql -u root --skip-password
# sleep 10s
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'$DB_HOST' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
# sleep 10s
kill -KILL mysqld_safe
exec "$@"

