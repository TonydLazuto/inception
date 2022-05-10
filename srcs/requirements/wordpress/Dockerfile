FROM debian:buster

RUN apt-get -y update \
    && apt-get -y upgrade \
	&& apt-get -y install wget vim procps curl dialog apt-utils

RUN	apt-get install -y apt-transport-https lsb-release ca-certificates \
	&& wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
	&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/php.list \
	&& apt-get update \
	&& apt-get install -y mariadb-client php7.4-fpm php7.4 php7.4-opcache \
	php7.4-mysql php7.4-curl php7.4-json php7.4-gd  php7.4-intl \
	php7.4-mbstring php7.4-xml php7.4-zip php7.4-readline

	#install wp-cli tools
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp-cli 
	#install wordpress

WORKDIR /var/www/html

# COPY ./tools/wp-config.sh /tmp/wp-config.sh
# COPY ./conf/wp-config.php /var/www/html/wp-config.php

RUN wp-cli core download --allow-root --path=./
RUN chown -R www-data:www-data /var/www/html


# RUN chmod +x /tmp/wp-config.sh

EXPOSE 9000

# CMD ["/bin/sh", "-x", "/tmp/wp-config.sh"]