FROM openjdk:8-jre-alpine
ADD docker-entrypoint.sh /
RUN CHMOD +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
