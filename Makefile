.PHONY:	build up down stop restart purge prune display logs

HOME = /home/aderose/data

vol_wp=@mkdir -p $(HOME)/wp
vol_mariadb=@mkdir -p $(HOME)/mariadb

up:
		$(vol_wp) $(vol_mariadb)
		docker-compose -f srcs/docker-compose.yml up -d -V --build --remove-orphans $(c)

down:
		docker-compose -f srcs/docker-compose.yml down -v --remove-orphans $(c)
		@sudo rm -rf $(HOME)

stop:
		docker-compose -f srcs/docker-compose.yml stop $(c)

restart: stop up

re:		down up

build:
		$(vol_wp) $(vol_mariadb)
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
		echo y | docker system prune
		echo y | docker system prune -a
		echo y | docker network prune

fclean:	down rm-volume
		docker system prune -a

logs:
		docker-compose -f srcs/docker-compose.yml logs --tail=100 -f $(c)

.SILENT:
