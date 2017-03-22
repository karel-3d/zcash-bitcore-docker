FROM ubuntu:16.10

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake

RUN git clone 'https://github.com/str4d/zcash.git'
RUN cd zcash && git checkout v1.0.4-bitcore-3
