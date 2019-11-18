ifndef TAG
TAG=latest
endif
build:
	docker build . -t 2chat/fpm:$(TAG)

push: build
	docker push 2chat/fpm:$(TAG)