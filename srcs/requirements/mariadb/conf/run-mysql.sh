#!/bin/sh

service mysql start

# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -uroot -proot
# echo "FLUSH PRIVILEGES;" | mysql -uroot -proot
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "CREATE USER '$MYSQL_USER' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "CREATE TABLE $DB_NAME.test(id INTEGER AUTO_INCREMENT, name varchar(255), PRIMARY KEY (id));" | mysql -u$MYSQL_USER -p$MYSQL_PASSWORD
echo "INSERT INTO $DB_NAME.test VALUES (1,'henry');" | mysql -u$MYSQL_USER -p$MYSQL_PASSWORD
echo "INSERT INTO $DB_NAME.test VALUES (2,'titi');" | mysql -u$MYSQL_USER -p$MYSQL_PASSWORD
echo "CREATE USER '$MYSQL_USER2' IDENTIFIED BY '$MYSQL_PASSWORD2';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD
echo "GRANT SHOW DATABASES, SELECT ON *.* TO '$MYSQL_USER2';" | mysql -uroot -p$MYSQL_ROOT_PASSWORD

service mysql stop

exec "$@"
