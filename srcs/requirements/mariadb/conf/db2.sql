CREATE DATABASE $MARIADB_DATABASE;
GRANT ALL ON *.* TO $MARIADB_ROOT_HOST@$DB_HOST IDENTIFIED BY $MARIADB_PASSWORD WITH GRANT OPTION;
FLUSH PRIVILEGES;

