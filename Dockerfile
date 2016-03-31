FROM ubuntu:15.10

RUN apt-get update
RUN apt-get -y install openjdk-8-jre-headless nodejs wget unzip

# Set path
ENV PATH ${PATH}:/usr/local/gradle-2.12/bin

# Install gradle
WORKDIR /usr/local
RUN wget https://services.gradle.org/distributions/gradle-2.12-bin.zip && \
    unzip gradle-2.12-bin.zip && \
    rm -f gradle-2.12-bin.zip

WORKDIR /app
