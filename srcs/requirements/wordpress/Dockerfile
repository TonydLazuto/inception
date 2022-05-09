FROM debian:buster

RUN apt-get -y update \
    && apt-get -y upgrade \
	&& apt-get -y install wget vim procps curl \
	php php-cli php-fpm php-json php-mysql \
	php-zip php-gd  php-mbstring php-curl \
	php-xml php-pear php-bcmath \
	mariadb-client
	#install wp-cli tools
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp-cli
	#install wordpress

WORKDIR /var/www/html

RUN wp-cli core download --allow-root

# COPY ./tools/wp-config.sh /tmp/wp-config.sh
# COPY ./conf/wp-config.php /var/www/html/wp-config.php

# RUN chmod +x /tmp/wp-config.sh

RUN wp-cli config create --allow-root --dbname=${WORDPRESS_DB_NAME} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASSWORD} --locale='en_DB'
RUN wp-cli core install --allow-root --url=${WORDPRESS_DB_HOST} --title=${WORDPRESS_DB_TITLE} --admin_user=${ADMIN_USERNAME} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL}

EXPOSE 9000

# ENTRYPOINT ["/bin/sh", "-x", "/tmp/wp-config.sh"]
CMD ["php-fpm"]