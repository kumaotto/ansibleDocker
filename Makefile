CONTAINER_NAME := ansible-ec2

.PHONY: build
build:
	docker build ./ -t ubuntu18_ansible:latest

.PHONY: run
run:
	docker run -itd --rm \
	--name $(CONTAINER_NAME) \
	--cap-add NET_ADMIN \
	ubuntu18_ansible:latest

.PHONY: login
login:
	docker exec -it $(CONTAINER_NAME) /bin/bash

.PHONY: stop
stop:
	docker stop $(CONTAINER_NAME)