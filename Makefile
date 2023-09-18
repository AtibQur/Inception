PROJECT = inception

LIST_CONTAINERS := $(shell docker ps -a -q)
LIST_VOLUMES := $(shell docker volume ls -q)

all: up

up:
	mkdir -p /Users/hqureshi/data/mariadb
	mkdir -p /Users/hqureshi/data/wordpress
	docker-compose -f src/docker-compose.yml up --build

stop:
	docker-compose -f src/docker-compose.yml stop

kill:
	docker-compose -f src/docker-compose.yml kill

down:
	docker-compose -f src/docker-compose.yml down
	docker rm -f $(LIST_CONTAINERS)
	docker volume rm -f $(LIST_VOLUMES)
	rm -r /Users/hqureshi/data

re: down up