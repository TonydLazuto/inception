#!/bin/sh

chmod 666 /etc/php/7.3/fpm/pool.d/www.conf
sed -i 's/^listen =.*.sock/listen = wordpress\:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# until mysqladmin --host=mariadb --user=root --password=$MYSQL_ROOT_PASSWORD ping \
#     && mariadb --host=mariadb --user=root --password=$MYSQL_ROOT_PASSWORD -e "SHOW DATABASES;" | grep $DB_NAME; do
# 	sleep 2s
# done
sleep 10s
#Generate 'wp-config.php' 
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --locale='en_DB'
#install wordpress
wp core install --url=$DB_HOST --title=$DB_TITLE --admin_user=$ADMIN_USERNAME --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL
# wp-cli user create bro bro@4242.fr --role=author --user_pass="pass" --allow-root

exec "$@"