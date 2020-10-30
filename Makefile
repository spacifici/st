DOCKER_IMAGE_ID:=$(shell docker images -q st:latest)
DOCKER_IMAGE_TARGET:=$(if $(DOCKER_IMAGE_ID),,build-docker-image)

all: build

build:
	@make -C src/

docker-build: $(DOCKER_IMAGE_TARGET)
	docker run -v "`pwd`/src:/src" st:latest make -C /src/

build-docker-image:
	docker build -t st:latest .

.PHONY: clean
clean:
	@make -C src/ clean
	rm -f src/config.h
