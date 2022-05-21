#!/bin/sh

until mysqladmin --host=$DB_HOST --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD ping \
    && mariadb --host=$DB_HOST --user=$ADMIN_USERNAME --password=$ADMIN_PASSWORD -e "SHOW DATABASES;" | grep $DB_NAME; do
	sleep 2s
done

#Generate 'wp-config.php'
wp-cli config create --allow-root --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$ADMIN_USERNAME --dbpass=$ADMIN_PASSWORD --locale='en_DB'
#install wordpress
wp-cli core install --allow-root --url=$DOMAIN_NAME --title=$DB_TITLE --admin_user=$ADMIN_USERNAME --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL
wp-cli user create $DB_USER $DB_USER@4242.fr --role=author --user_pass=$DB_PASSWORD --allow-root
wp-cli user create $DB_USER2 $DB_USER2@4242.fr --role=editor --user_pass=$DB_PASSWORD2 --allow-root
# wp theme install twentynineteen --allow-root
# wp theme activate twentynineteen --allow-root

exec "$@"