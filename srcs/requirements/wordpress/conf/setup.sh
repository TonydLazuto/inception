#!/bin/sh

# until mysqladmin --host=$DB_HOST --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD ping \
#     && mariadb --host=$DB_HOST --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD -e "SHOW DATABASES;" | grep $DB_NAME; do
# 	sleep 2s
# done

#Generate 'wp-config.php'
wp-cli config create --allow-root --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$ADMIN_USERNAME --dbpass=$ADMIN_PASSWORD --locale='en_DB'
#install wordpress
wp-cli core install --allow-root --url=$DB_HOST --title=$DB_TITLE --admin_user=$ADMIN_USERNAME --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL
# wp-cli user create admin bro@4242.fr --role=author --user_pass="pass" --allow-root

exec "$@"