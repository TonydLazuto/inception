FROM debian:buster

RUN apt-get -y update 
    RUN apt-get -y upgrade 
	RUN apt-get -y install wget 
    RUN apt-get install -y vim 
    RUN apt-get -y install nginx 
	RUN mkdir /etc/nginx/ssl
	RUN openssl req -x509 -newkey rsa:4096 -sha256 -days 365 -nodes -out /etc/nginx/ssl/key.crt -keyout /etc/nginx/ssl/mykey.key -subj "/C=FR/ST=Paris/L=Paris/OU=ad/CN=localsite"

#USER myuser

EXPOSE 443

COPY ./conf/fastcgi_common /etc/nginx/conf.d/fastcgi_common
COPY ./conf/fastcgi_common /etc/nginx/fastcgi_common
COPY ./conf/nginx.conf /etc/nginx/conf.d/nginx.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
