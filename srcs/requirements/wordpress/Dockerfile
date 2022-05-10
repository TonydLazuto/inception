FROM debian:buster

RUN apt-get -y update \
    && apt-get -y upgrade \
	&& apt-get -y install wget vim procps curl mariadb-client


ENV DEBIAN_FRONTEND noninteractive

RUN    apt-get install -y apt-transport-https lsb-release ca-certificates \
       && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
       && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" >> /etc/apt/sources.list.d/php.list

RUN apt-get update && apt-get install -y php7.3-fpm php7.3 php7.3-opcache \
	php7.3-mysql php7.3-curl php7.3-json php7.3-gd  php7.3-intl \
	php7.3-mbstring php7.3-xml php7.3-zip php7.3-readline

RUN mkdir -p /run/php

	#install wp-cli tools
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp-cli
	# && chown -R www-data:www-data /var/www/html

# WORKDIR /var/www/html

COPY ./tools/wp-config.sh /tmp/wp-config.sh
# COPY ./conf/wp-config.php /var/www/html/wp-config.php

RUN wp-cli core download --allow-root
#--path=./
RUN chmod +x /tmp/wp-config.sh

EXPOSE 9000

# ENTRYPOINT cat
CMD ["/usr/sbin/php-fpm7.3", "-R", "--nodaemonize"]
