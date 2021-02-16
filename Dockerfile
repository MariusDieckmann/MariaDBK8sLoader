FROM alpine

LABEL maintainer Marius Dieckmann <m.die0123@gmail.com>

RUN apk -U upgrade
RUN apk --update add mysql-client wget

COPY run.sh .
RUN chmod 755 run.sh

ENTRYPOINT ["/bin/sh", "-c", "./run.sh"]