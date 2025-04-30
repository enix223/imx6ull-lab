FROM docker.ilovechina.top/ubuntu:22.04

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential git gcc make sudo
COPY imxdownload /imx6ull/imxdownload
COPY gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf.tar.xz /tmp/gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf.tar.xz
RUN mkdir -p /imx6ull
RUN tar -xf /tmp/gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf.tar.xz -C /imx6ull/
ENV PATH="/imx6ull/:/imx6ull/gcc-linaro-4.9-2014.11-x86_64_arm-linux-gnueabihf/bin:$PATH"
