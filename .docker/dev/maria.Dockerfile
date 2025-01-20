ARG BASE_IMAGE_TAG=latest
ARG DOCKER_REPO_NAME=opillion
FROM ${DOCKER_REPO_NAME}/maria:${BASE_IMAGE_TAG}

ADD .docker/dev/maria/init.sql /etc/mariadb/init.sql

RUN chmod -R 655 /etc/mariadb/init.sql

