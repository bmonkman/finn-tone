OPENAPI_GENERATOR_VERSION=v5.0.0-beta
DOCKER_IMAGE?=finn-tone-api:latest
generate:
	docker run -v ${PWD}:/tmp/ openapitools/openapi-generator-cli:${OPENAPI_GENERATOR_VERSION} generate -i /tmp/schema.yml -g python-flask -o /tmp/application

run:
	npm start --prefix application/

docs:
	docker run -v ${PWD}:/tmp/ openapitools/openapi-generator-cli:${OPENAPI_GENERATOR_VERSION} generate -i /tmp/schema.yml -g markdown -o /tmp/docs

docker:
	docker build application/ -t ${DOCKER_IMAGE}

deploy: docker
	docker tag ${DOCKER_IMAGE} bmonkman/${DOCKER_IMAGE}
	docker push bmonkman/${DOCKER_IMAGE}
	kubectl apply -f kubernetes/
	kubectl rollout restart deploy tone-service

.PHONY: generate run docs docker deploy
