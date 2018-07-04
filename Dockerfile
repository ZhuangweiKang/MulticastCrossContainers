FROM ubuntu:16.04

RUN apt-get update

# Install gcc support
RUN apt-get update && \
    apt-get install build-essential software-properties-common -y && \
    add-apt-repository ppa:ubuntu-toolchain-r/test -y &&
    apt-get update && \
    apt-get install gcc-snapshot -y && \
    apt-get update && \
    apt-get install gcc-6 g++-6 -y && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 60 --slave /usr/bin/g++ g++ /usr/bin/g++-6 && \
    apt-get install gcc-4.8 g++-4.8 -y && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.8;


# Install iperf
RUN apt-get install -y iperf

WORKDIR /home

COPY ./consumer ./
COPY ./producer ./
