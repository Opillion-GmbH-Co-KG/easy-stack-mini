ARG PROD_IMAGE_TAG=latest
ARG DOCKER_REPO=opillion
FROM ${DOCKER_REPO}/mssql:${PROD_IMAGE_TAG}
