FROM redis:7.4-rc2-alpine3.20

RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.17/main" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/v3.17/community" >> /etc/apk/repositories

RUN apk update \
    && apk upgrade
