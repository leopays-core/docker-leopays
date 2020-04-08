FROM ubuntu:18.04

ARG binaries_link=https://github.com/leopays-chain/leopays/releases/download/v0.1.0-rc1/leopays_0.1.0-rc1-ubuntu-18.04_amd64.deb

ENV LEOPAYS_VERSION=0.1.0-rc1
ENV LEOPAYS_ROOT=/usr/opt/leopays/$LEOPAYS_VERSION

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    openssl ca-certificates wget libssl1.1 libicu60 libusb-1.0-0 libcurl3-gnutls && \
    rm -rf /var/lib/apt/lists/*

#RUN wget $binaries_link -o /binaries.deb
COPY ./leopays_$LEOPAYS_VERSION-ubuntu-18.04_amd64.deb /binaries.deb
RUN apt-get install -y /binaries.deb && rm /binaries.deb

COPY ./config.ini /
COPY ./leopays-node.sh /opt/leopays/bin/leopays-node.sh
RUN chmod +x /opt/leopays/bin/leopays-node.sh
RUN ls -s /opt/leopays/bin
ENV PATH $LEOPAYS_ROOT/bin:/opt/leopays/bin:$PATH
