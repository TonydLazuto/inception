.PHONY:	build up down stop restart purge prune display logs

up:
		@mkdir -p /home/aderose/data/nginx-v /home/aderose/data/wp /home/aderose/data/mariadb
		docker-compose -f srcs/docker-compose.yml up -d $(c)

down:
		docker-compose -f srcs/docker-compose.yml down $(c)

stop:
		docker-compose -f srcs/docker-compose.yml stop $(c)

restart:
		docker-compose -f srcs/docker-compose.yml down $(c)
		docker-compose -f srcs/docker-compose.yml up -d $(c)

re:		stop build up

build:
		@mkdir -p /home/aderose/data/nginx-v /home/aderose/data/wp /home/aderose/data/mariadb
		docker-compose -f srcs/docker-compose.yml build $(c)
buildup: build up

config:
		docker-compose -f srcs/docker-compose.yml config $(c)

purge:
		@sudo rm -rf /home/aderose/data/
		docker rmi mariadb
		docker rmi wordpress
		docker rmi nginx
		docker rmi debian:buster

display:
		docker ps -a
		docker images
		docker network ls
		docker volume ls

prune: 
		@sudo rm -rf /home/aderose/data/
		docker system prune -a

logs:
		docker-compose -f srcs/docker-compose.yml logs --tail=100 -f $(c)

.SILENT:
