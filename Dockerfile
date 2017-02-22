FROM ubuntu:16.10
MAINTAINER FINTProsjektet (www.fintprosjektet.no)

ENV NODE_VERSION 7.5.0
ENV GRADLE_VERSION 3.3

RUN apt-get update
RUN apt-get -y install openjdk-8-jdk wget curl unzip xz-utils python build-essential

# Setup certificates in openjdk-8
RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure

# Set path
ENV PATH ${PATH}:/usr/local/gradle-$GRADLE_VERSION/bin:/usr/local/node-v$NODE_VERSION-linux-x64/bin

# Install nodejs
WORKDIR /usr/local
RUN wget https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz && \
  tar xf node-v$NODE_VERSION-linux-x64.tar.xz && \
  rm -f node-v$NODE_VERSION-linux-x64.tar.xz

# Install gradle
RUN wget https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip && \
    unzip gradle-$GRADLE_VERSION-bin.zip && \
    rm -f gradle-$GRADLE_VERSION-bin.zip

WORKDIR /app
