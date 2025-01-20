ARG BASE_IMAGE_TAG=latest
ARG DOCKER_REPO=opillion
FROM ${DOCKER_REPO}/bitwarden:${BASE_IMAGE_TAG}

ADD .docker/dev/bitwarden/script /usr/local/bin

RUN chmod +x /usr/local/bin/create_user.sh

