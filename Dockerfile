FROM ubuntu:16.10

RUN apt-get update
#RUN apt-get install -y git
RUN apt-get install -y nodejs nodejs-legacy npm git
RUN apt-get install -y libzmq3-dev

RUN apt-get install -y wget
ADD fetch-params.sh /fetch-params.sh
RUN /fetch-params.sh

#RUN git clone https://github.com/str4d/zcash.git
RUN mkdir ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN mkdir /.zcash-params

ADD confs/bitcore-node.json /bitcore-node.json
ADD confs/zcash.conf /zcash.conf
ADD zcashd /zcashd

ADD _run_inside.sh /run_inside.sh

EXPOSE 3002
