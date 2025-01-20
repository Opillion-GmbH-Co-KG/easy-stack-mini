ARG BASE_IMAGE_TAG=latest
FROM opillion/minio:${BASE_IMAGE_TAG}

USER root
COPY .docker/dev/minio/create-access-key.sh /usr/bin/create-access-key.sh
RUN chmod 655 /usr/bin/create-access-key.sh

