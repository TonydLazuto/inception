#!/bin/sh
#create wp-config.php
#wp-cli config create --dbname=127.0.0.1 --dbuser=YOUR_DB_USERNAME --dbpass=YOUR_DB_PASSWORD --locale=en_DB --allow-root \ 
#wp-cli core install --url=127.0.0.1 --title=YOUR_BLOG_TITLE --admin_user=ADMIN_USERNAME --admin_password=ADMIN_PASSWORD --admin_email=ADMIN_EMAIL --allow-root
wp-cli config create --allow-root --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --locale='en_DB'
wp-cli core install --allow-root --url=${WORDPRESS_DB_HOST} --title=${WORDPRESS_DB_TITLE} --admin_user=${ADMIN_USERNAME} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL}

# /bin/bash