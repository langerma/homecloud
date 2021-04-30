docker-clean:
	docker compose down

docker-dep:

docker-test:

docker-build:
	docker compose build --pull

docker-deploy:
	docker compose up --detach

docker-release:
