.PHONY:	build up down stop restart purge prune display logs

HOME = /home/aderose/data

vol_nginx=mkdir -p $(HOME)/nginx-v
vol_wp=mkdir -p $(HOME)/wp
vol_mariadb=mkdir -p $(HOME)/mariadb

up:
		$(vol_nginx) $(vol_wp) $(vol_mariadb)
		docker-compose -f srcs/docker-compose.yml up -d --build $(c)

down:
		docker-compose -f srcs/docker-compose.yml down $(c)

stop:
		docker-compose -f srcs/docker-compose.yml stop $(c)

restart:
		docker-compose -f srcs/docker-compose.yml down $(c)
		docker-compose -f srcs/docker-compose.yml up -d $(c)

re:		stop build up

build:
		$(vol_nginx) $(vol_wp) $(vol_mariadb)
		docker-compose -f srcs/docker-compose.yml build $(c)

config:
		docker-compose -f srcs/docker-compose.yml config $(c)

purge:
		@sudo rm -rf $(HOME)
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
		@sudo rm -rf ${HOME}
		docker system prune -a

logs:
		docker-compose -f srcs/docker-compose.yml logs --tail=100 -f $(c)

.SILENT:
