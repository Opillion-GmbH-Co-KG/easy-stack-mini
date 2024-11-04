FROM alpine:latest

RUN apk add --no-cache bash

CMD ["tail", "-f", "/dev/null"]
