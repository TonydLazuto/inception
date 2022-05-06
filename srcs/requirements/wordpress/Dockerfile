FROM debian:buster

RUN apt-get -y update \
    && apt-get -y upgrade \
	&& apt-get -y install wget procps curl vim \
	php php-cli php-fpm php-json php-mysql \
	php-zip php-gd  php-mbstring php-curl \
	php-xml php-pear php-bcmath
	#install wp-cli tools
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp-cli
	#install wordpress
RUN wp-cli core download --allow-root

COPY ./tools/wp-config.sh /tmp/wp-config.sh

EXPOSE 9000 3306

CMD ["/bin/sh", "/tmp/wp-config.sh"]