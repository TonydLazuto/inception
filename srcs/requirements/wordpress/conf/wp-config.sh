#!/bin/sh


sed -i 's|listen = /run/php/php7.3-fpm.sock|listen = 9000|g' /etc/php/7.3/fpm/pool.d/www.conf

#Generate 'wp-config.php' 
wp-cli config create --allow-root --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --locale='en_DB'
#install wordpress
wp-cli core install --allow-root --url=${DB_HOST} --title=${DB_TITLE} --admin_user=${ADMIN_USERNAME} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL}
# wp-cli user create bro bro@4242.fr --role=author --user_pass="pass" --allow-root

