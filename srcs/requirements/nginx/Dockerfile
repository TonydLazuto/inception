FROM alpine:3.15

RUN sudo apt-get update -y \
    sudo apt-get upgrade -y

COPY ./conf /home/nginx_conf

CMD ["nginx.sh"]

