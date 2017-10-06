# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: nodejs
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM resin/qemux86-alpine-python

MAINTAINER Alexander Thurman, <it.snake.co.inc@gmail.com>

RUN         apk update \
            && apk upgrade \
            && apk add --no-cache curl ca-certificates openssl \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/ash", "/entrypoint.sh"]
