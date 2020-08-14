FROM gradle:6.0.1-jdk13 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build -x test

FROM openjdk:13-alpine
LABEL maintainer="Thiago Tenório"
ENV TZ Brazil/East
RUN mkdir /opt/app
RUN apk add --no-cache tzdata \
   && ln -sf /usr/share/zoneinfo/Brazil/East /etc/localtime \
   && echo "Brazil/East" > /etc/timezone \
   && rm -rf /var/cache/apk/* \
   && rm -rf /tmp/* \
   && rm -rf /var/tmp/*

RUN mkdir /app

COPY --from=build /home/gradle/src/build/libs/*.jar /app/config-server.jar

ENTRYPOINT ["java", "-jar","/app/config-server.jar"]
