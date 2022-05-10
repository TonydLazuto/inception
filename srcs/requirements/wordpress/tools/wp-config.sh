#!/bin/sh
#create wp-config.php
#wp-cli config create --dbname=127.0.0.1 --dbuser=YOUR_DB_USERNAME --dbpass=YOUR_DB_PASSWORD --locale=en_DB --allow-root \ 
#wp-cli core install --url=127.0.0.1 --title=YOUR_BLOG_TITLE --admin_user=ADMIN_USERNAME --admin_password=ADMIN_PASSWORD --admin_email=ADMIN_EMAIL --allow-root
# wp-cli config create --allow-root --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --locale='en_DB'
# wp-cli core install --allow-root --url=${DB_HOST} --title=${DB_TITLE} --admin_user=${ADMIN_USERNAME} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL} --path
# wp user create bro bro@4242.fr --role=author --user_pass="pass" --allow-root
chown -R www-data /var/www/*
chmod -R 755 /var/www/*
# ls -l
# echo "--------"
# cat wp-config.php
# echo "--------"
# env
# echo "--------"
# exec php-fpm7.4 --nodaemonize