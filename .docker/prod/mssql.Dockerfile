ARG BASE_IMAGE_TAG=latest
ARG DOCKER_REPO=opillion
FROM ${DOCKER_REPO}/mssql:${BASE_IMAGE_TAG}

ENV ACCEPT_EULA=Y
ENV MSSQL_AGENT_ENABLED=true

ADD .docker/prod/mssql/init.d /usr/init.d

ADD .docker/prod/mssql/scripts/configure-db.sh /usr/sbin
ADD .docker/prod/mssql/scripts/entrypoint.sh /usr/sbin

ENTRYPOINT ["/usr/sbin/entrypoint.sh"]
