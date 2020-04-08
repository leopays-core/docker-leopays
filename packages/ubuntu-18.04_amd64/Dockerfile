FROM leopays/builder

ARG repo=https://github.com/leopays-chain/leopays.git
ARG branch=release/2.0.x
ARG symbol=LPC

RUN git clone -b $branch $repo /leopays

WORKDIR /leopays

RUN git submodule update --init --recursive

RUN echo "$branch:$(git rev-parse HEAD)" > /etc/leopays-version

RUN ./scripts/leopays_build.sh -i /opt/leopays -y 

RUN ./scripts/leopays_install.sh

RUN rm /leopays/build/bin/trace_api_util && \
    rm /leopays/build/bin/leopays-launcher && \
    ls /leopays/build/bin

RUN cd /leopays/build/packages && chmod 755 ./*.sh && ./generate_package.sh deb
