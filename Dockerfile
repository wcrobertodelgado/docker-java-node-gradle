FROM ubuntu:15.10

RUN apt-get update
RUN apt-get -y install openjdk-8-jre-headless wget unzip xz-utils

# Set path
ENV PATH ${PATH}:/usr/local/gradle-2.12/bin:/usr/local/node-v5.9.1-linux-x64/bin

# Install nodejs
WORKDIR /usr/local
RUN wget https://nodejs.org/dist/v5.9.1/node-v5.9.1-linux-x64.tar.xz && \
  tar xf node-v5.9.1-linux-x64.tar.xz && \
  rm -f node-v5.9.1-linux-x64.tar.xz

# Install gradle
RUN wget https://services.gradle.org/distributions/gradle-2.12-bin.zip && \
    unzip gradle-2.12-bin.zip && \
    rm -f gradle-2.12-bin.zip

WORKDIR /app
