FROM centos:centos7

MAINTAINER James Cunningham <james@einherj.ar.com>

ENV MAJ 2
ENV MIN 44
ENV GRID selenium-server-standalone-2.44.0.jar
ENV HUB_PORT 4444
ENV LISTEN_PORT 4445

EXPOSE 4444 4445

RUN curl "http://selenium-release.storage.googleapis.com/$MAJ.$MIN/$GRID" -o /tmp/$GRID
RUN yum install -y java

CMD java -jar /tmp/$GRID -role node -port $LISTEN_PORT -hub "http://localhost:$HUB_PORT/grid/register"