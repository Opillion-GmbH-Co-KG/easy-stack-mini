ARG BASE_IMAGE_TAG=latest
ARG DOCKER_REPO=opillion
FROM ${DOCKER_REPO}/mssql:${BASE_IMAGE_TAG}

USER root
ENV ACCEPT_EULA=Y
ENV MSSQL_AGENT_ENABLED=true

ADD .docker/dev/mssql/init.d /usr/init.d
ADD .docker/dev/mssql/scripts/configure-db.sh /usr/sbin
ADD .docker/dev/mssql/scripts/entrypoint.sh /usr/sbin

ENTRYPOINT ["/usr/sbin/entrypoint.sh"]
