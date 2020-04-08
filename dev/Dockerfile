FROM leopays/builder

ARG repo=https://github.com/leopays-chain/leopays.git
ARG branch=release/2.0.x
ARG symbol=LPC
ARG build_type=Release

RUN apt-get update && apt-get upgrade -y && apt-get install -y git
RUN git clone -b $branch $repo /leopays && \
    cd /leopays && git submodule update --init --recursive && \
    echo "$branch:$(git rev-parse HEAD)" > /etc/leopays-version && \
    ./scripts/leopays_build.sh -m -y -s $symbol -o $build_type -i /opt/leopays && \
    ./scripts/leopays_install.sh && \
    cp /leopays/docker/config.ini / && \
    ln -s /leopays/unittests/contracts /contracts && \
    cp /leopays/docker/leopays-node.sh /opt/leopays/bin/leopays-node.sh && \
    ln -s /leopays/tutorials /tutorials

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y && \
    openssl ca-certificates vim psmisc python3-pip && \
    rm -rf /var/lib/apt/lists/*
RUN pip3 install numpy
ENV LEOPAYS_ROOT=/opt/leopays
RUN chmod +x /opt/leopays/bin/leopays-node.sh
ENV LD_LIBRARY_PATH /usr/local/lib
ENV PATH $LEOPAYS_ROOT/bin:$PATH
