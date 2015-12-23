TAG=5.3.0
default: build

build: 
	docker build -t ocelotuproar/alphine-node:$(TAG) .
	docker build -t ocelotuproar/alphine-node:$(TAG)-onbuild -f Dockerfile-onbuild .

push:
	docker push ocelotuproar/alphine-node:$(TAG)
	docker push ocelotuproar/alphine-node:$(TAG)-onbuild
