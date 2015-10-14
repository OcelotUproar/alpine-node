default: build

build: 
	docker build -t ocelotuproar/alphine-node:4.2.1 .
	docker build -t ocelotuproar/alphine-node:4.2.1-onbuild -f Dockerfile-onbuild .

push:
	docker push ocelotuproar/alphine-node:4.2.1
	docker push ocelotuproar/alphine-node:4.2.1-onbuild
