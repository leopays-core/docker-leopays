FROM leopays/builder as builder

ARG repo=https://github.com/leopays-chain/leopays.git
ARG branch=release/2.0.x
ARG symbol=LPC
ARG build_type=Release

RUN git clone -b $branch $repo --recursive /leopays && \
    cd /leopays && echo "$branch:$(git rev-parse HEAD)" > /etc/leopays-version && \
    ./scripts/leopays_build.sh -y -m -s $symbol -o $build_type -i /tmp/build && \
    ./scripts/leopays_install.sh


FROM ubuntu:18.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    openssl ca-certificates libssl1.1 libicu60 libusb-1.0-0 libcurl3-gnutls && \
    rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/lib/* /usr/local/lib/
COPY --from=builder /tmp/build/bin /opt/leopays/bin
COPY --from=builder /leopays/docker/config.ini /
COPY --from=builder /etc/leopays-version /etc
COPY --from=builder /leopays/docker/leopays-node.sh /opt/leopays/bin/leopays-node.sh
ENV LEOPAYS_ROOT=/opt/leopays
RUN chmod +x /opt/leopays/bin/leopays-node.sh
ENV LD_LIBRARY_PATH /usr/local/lib
ENV PATH $LEOPAYS_ROOT/bin:$PATH
