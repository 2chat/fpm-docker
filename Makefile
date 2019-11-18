build:
	docker build . -t 2chat/fpm

push: build
	docker push 2chat/fpm