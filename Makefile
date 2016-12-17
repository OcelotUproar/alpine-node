TAG=7.2.1
default: build

build: 
	docker build -t ocelotuproar/alpine-node:$(TAG) .
	docker build -t ocelotuproar/alpine-node:$(TAG)-onbuild -f Dockerfile-onbuild .

debug:
	docker run -it ocelotuproar/alpine-node:$(TAG) /bin/sh

push:
	docker push ocelotuproar/alpine-node:$(TAG)
	docker push ocelotuproar/alpine-node:$(TAG)-onbuild
