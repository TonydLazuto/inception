FROM debian:buster

RUN apt-get -y update \
    && apt-get -y upgrade \
	&& apt-get -y install wget procps vim
	#install wp-cli tools
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& sudo mv wp-cli.phar /usr/local/bin/wp-cli \
	#install wordpress
	&& wp-cli core download \
	#create wp-config.php
	&& wp-cli config create --dbname=YOUR_DB_NAME --dbuser=YOUR_DB_USERNAME --dbpass=YOUR_DB_PASSWORD --locale=en_DB \
	&& wp-cli core install --url=YOUR_DOMAIN_NAME --title=YOUR_BLOG_TITLE --admin_user=ADMIN_USERNAME --admin_password=ADMIN_PASSWORD --admin_email=ADMIN_EMAIL


EXPOSE 9000 3306

