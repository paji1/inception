.DEFAULT_GOAL := all

all:  down clean
	docker-compose  -f ./srcs/docker-compose.yml up --build
down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	@if [ -n "$$(docker volume ls -q)" ]; then \
		docker volume rm $$(docker volume ls -q); \
	fi
	docker container prune -f

.SILENT: all down 
.PHONY: down
