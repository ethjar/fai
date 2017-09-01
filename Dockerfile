FROM debian:stretch

RUN apt-get update # 20170901
RUN apt-get install -y curl gnupg apt-utils

RUN curl -Ls http://fai-project.org/download/074BCDE4.asc | apt-key --keyring /etc/apt/trusted.gpg.d/fai-keyring.gpg add - && \
    echo 'deb http://fai-project.org/download stretch koeln' > /etc/apt/sources.list.d/fai.list
RUN apt-get update
RUN apt-get install -y fai-server fai-quickstart && \
    apt-get install -y xorriso squashfs-tools binutils && \
    apt-get autoremove

ADD nfsroot.conf /etc/fai/nfsroot.conf
