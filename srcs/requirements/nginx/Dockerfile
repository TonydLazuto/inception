FROM alpine:3.15

RUN sudo apt-get -y update \
    && sudo apt-get -y upgrade \
    && apt-get install -y vim \
    && apt-get install -y wget \
    && apt-get -y install nginx

COPY ./conf/nginx_conf /home/nginx_conf

CMD [""]
