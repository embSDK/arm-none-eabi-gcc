FROM ubuntu:22.04
LABEL maintainer="ztluo <me@ztluo.dev>"
LABEL Description="Image for building and testing arm-none-eabi-gcc projects"
WORKDIR /work

ADD . /work

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git cmake ninja-build python3 python3-pip ccache bzip2 wget && \
    apt-get clean
RUN pip3 install pyelftools
RUN wget -qO- https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 | tar -xj

ENV PATH "/work/gcc-arm-none-eabi-10.3-2021.10/bin:$PATH"
