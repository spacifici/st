FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -yqq update && \
    apt-get install -yqq \
        build-essential \
        libharfbuzz-dev \
        libx11-dev \
        libxft-dev \
        x11proto-dev
