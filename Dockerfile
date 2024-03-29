FROM ubuntu

LABEL maintainer Marius Dieckmann <m.die0123@gmail.com>

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install wget mysql-client sed

COPY run.sh .
RUN chmod 755 run.sh

ENTRYPOINT ["/bin/bash", "-c", "./run.sh"]
