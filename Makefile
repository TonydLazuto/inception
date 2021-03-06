.PHONY:	build up down stop restart re config prune display logs rm-volume fclean

HOME = /home/aderose/data

up:
		mkdir -p $(HOME)/wp
		mkdir -p $(HOME)/mariadb
		docker-compose -f srcs/docker-compose.yml up -d -V --build --remove-orphans $(c)

down:
		docker-compose -f srcs/docker-compose.yml down -v --remove-orphans $(c)

stop:
		docker-compose -f srcs/docker-compose.yml stop $(c)

restart: stop up

re:		down up

build:
		mkdir -p $(HOME)/wp
		mkdir -p $(HOME)/mariadb
		docker-compose -f srcs/docker-compose.yml build $(c)

config:
		docker-compose -f srcs/docker-compose.yml config $(c)

rm-volume:
		@sudo rm -rf $(HOME)

display:
		docker ps -a
		docker images
		docker network ls
		docker volume ls

prune:
		echo y | docker system prune --all
		echo y | docker network prune
		docker system prune --force

fclean:	down rm-volume prune

logs:
		docker-compose -f srcs/docker-compose.yml logs --tail=100 -f $(c)

.SILENT:
