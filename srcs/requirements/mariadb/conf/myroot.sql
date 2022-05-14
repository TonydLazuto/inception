CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER '$MYSQL_USER' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER';
CREATE USER '$MYSQL_USER2' IDENTIFIED BY '$MYSQL_PASSWORD2';
GRANT SHOW DATABASES, SELECT ON *.* TO '$MYSQL_USER2';
EOSQL