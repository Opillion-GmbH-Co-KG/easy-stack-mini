ARG BASE_IMAGE_TAG=latest
ARG DOCKER_REPO_NAME=opillion
FROM ${DOCKER_REPO_NAME}/redis:${BASE_IMAGE_TAG}

COPY .docker/dev/redis/redis.conf /usr/local/etc/redis/redis.conf
RUN apk add --no-cache wget ca-certificates
