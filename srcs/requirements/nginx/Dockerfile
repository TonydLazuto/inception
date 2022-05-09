FROM debian:buster

RUN apt-get -y update && apt-get -y upgrade \
	&& apt-get -y install wget vim procps nginx \
	&& mkdir /etc/nginx/ssl \
	&& openssl req -x509 -newkey rsa:4096 -sha256 -days 365 -nodes -out /etc/nginx/ssl/key.crt -keyout /etc/nginx/ssl/mykey.key -subj "/C=FR/ST=Paris/CN=localsite" \
    && chmod 755 /etc/nginx/ssl/*
#USER myuser

EXPOSE 443

COPY ./conf/fastcgi_common /etc/nginx/conf.d/fastcgi_common
COPY ./conf/fastcgi_common /etc/nginx/fastcgi_common
COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
