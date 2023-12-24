.DEFAULT_GOAL := all

all:  down clean
	docker-compose  -f ./srcs/docker-compose.yml up --build
down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	-docker volume rm $(shell docker volume ls -q); 
	-docker container prune -f
	-docker image prune -a -f 

.SILENT: all down 
.PHONY: down
