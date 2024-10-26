include ../../../make.inc
include .env

build_docker_image:
	docker build -t $(DOCKER_IMAGE_NAME) -f Dockerfile .

run_docker_image:
	docker run -d -p $(PORT):$(PORT) $(DOCKER_IMAGE_NAME)

push_docker_image:
	docker push $(DOCKER_IMAGE_NAME)

deploy_docker_image:
	gcloud run deploy fast-app \
	--image=$(DOCKER_IMAGE_NAME) \
	--region=$(LOCATION) \
	--allow-unauthenticated \
	--port=$(PORT)
