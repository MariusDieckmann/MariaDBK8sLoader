FROM alpine

LABEL maintainer Marius Dieckmann <m.die0123@gmail.com>

RUN apk -U upgrade
RUN apk --update add mariadb-client

COPY run.sh .

ENTRYPOINT ["/bin/bash", "-c", "run.sh"]