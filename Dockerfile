# Pull base image
FROM jenkins/jenkins:latest

# Maintainer info
MAINTAINER Ngakan N Gandhi <n.nyoman.gandhi@gmail.com>

# Set user to root
USER root

# Install required packages
RUN apt-get update && \
    apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        software-properties-common

# Install Golang
RUN apt-get install -y golang-go

# Expose port
EXPOSE 8080