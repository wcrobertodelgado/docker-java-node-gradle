FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install openjdk-8-jdk wget curl unzip xz-utils python build-essential

# Setup certificates in openjdk-8
RUN /var/lib/dpkg/info/ca-certificates-java.postinst configure

# Set path
ENV PATH ${PATH}:/usr/local/gradle-3.0/bin:/usr/local/node-v6.5.0-linux-x64/bin

# Install nodejs
WORKDIR /usr/local
RUN wget https://nodejs.org/dist/v6.5.0/node-v6.5.0-linux-x64.tar.xz && \
  tar xf node-v6.5.0-linux-x64.tar.xz && \
  rm -f node-v6.5.0-linux-x64.tar.xz

# Install gradle
RUN wget https://services.gradle.org/distributions/gradle-3.0-bin.zip && \
    unzip gradle-3.0-bin.zip && \
    rm -f gradle-3.0-bin.zip

# Add common Spring dependencies
ADD build.gradle /usr/local/gradle-3.0/
RUN gradle -b /usr/local/gradle-3.0/build.gradle clean

WORKDIR /app
