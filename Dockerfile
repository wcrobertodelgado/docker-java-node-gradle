FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install openjdk-8-jdk wget curl unzip xz-utils python

# Setup certificates in openjdk-8
RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure

# Set path
ENV PATH ${PATH}:/usr/local/gradle-2.14/bin:/usr/local/node-v6.2.2-linux-x64/bin

# Install nodejs
WORKDIR /usr/local
RUN wget https://nodejs.org/dist/v6.2.2/node-v6.2.2-linux-x64.tar.xz && \
  tar xf node-v6.2.2-linux-x64.tar.xz && \
  rm -f node-v6.2.2-linux-x64.tar.xz

# Install gradle
RUN wget https://services.gradle.org/distributions/gradle-2.14-bin.zip && \
    unzip gradle-2.14-bin.zip && \
    rm -f gradle-2.14-bin.zip

WORKDIR /app
