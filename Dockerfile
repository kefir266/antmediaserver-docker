FROM debian:9.11

ARG AntMediaServer

RUN apt-get update
RUN apt-get install -y libx11-dev
RUN apt-get install -y wget

ADD ./${AntMediaServer} /home

RUN cd home \
    && pwd \
    && wget https://raw.githubusercontent.com/ant-media/Scripts/master/install_ant-media-server.sh \
    && chmod 755 install_ant-media-server.sh

RUN cd home \
    && pwd \
    && ./install_ant-media-server.sh ${AntMediaServer}

ENTRYPOINT service antmedia start; while true; do sleep 1000; done
