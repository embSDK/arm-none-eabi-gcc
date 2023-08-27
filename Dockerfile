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
RUN wget -qO- https://armkeil.blob.core.windows.net/developer/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi.tar.xz | tar -xvJ

ENV PATH "/work/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi/bin:$PATH"
