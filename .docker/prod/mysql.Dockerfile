ARG BASE_IMAGE_TAG=latest
ARG DOCKER_REPO=opillion
FROM ${DOCKER_REPO}/mysql:${BASE_IMAGE_TAG}

ADD .docker/prod/mysql/init-raw.sql /etc/mysql/init-raw.sql
ADD .docker/prod/mysql/entrypoint.sh /etc/mysql/entrypoint.sh
ADD .docker/prod/mysql/my.cnf /etc/mysql/my.cnf

RUN chmod -R 655 /etc/mysql/init-raw.sql && \
    chmod -R 755 /etc/mysql/entrypoint.sh && \
    mkdir -p /usr/local/mysql/mysql-files && \
    chown mysql:mysql /usr/local/mysql/mysql-files && \
    chmod 755 /usr/local/mysql/mysql-files && \
    mkdir /var/run/mysql && \
    chown mysql:mysql /var/run/mysql && \
    chmod 700 /var/run/mysql

