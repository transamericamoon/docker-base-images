FROM transamericamoon/jre-8-alpine
MAINTAINER John Moon <john.moon@transamerica.com>

ARG MIRROR=http://apache.mirrors.pair.com
ARG VERSION=3.4.8

LABEL name="zookeeper" version=$VERSION

RUN apk add --no-cache wget bash \
    && mkdir /opt \
    && wget -q -O - $MIRROR/zookeeper/zookeeper-$VERSION/zookeeper-$VERSION.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-$VERSION /opt/zookeeper \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg \
    && mkdir -p /tmp/zookeeper

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

ENV APP_EXE='/opt/zookeeper/bin/zkServer.sh start-foreground'
