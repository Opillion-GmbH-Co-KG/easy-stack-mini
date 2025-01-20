ARG DEV_IMAGE_TAG=latest
ARG DOCKER_REPO=opillion
FROM ${DOCKER_REPO}/bitwarden:${DEV_IMAGE_TAG}

RUN bw config server http://bitwarden:86
