FROM debian:jessie-slim

RUN TARGET_VERSION=4.8 \
&& apt-get -q update \
&& apt-get -yq install gcc-$TARGET_VERSION g++-$TARGET_VERSION make cmake \
&& update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-$TARGET_VERSION 999 \
&& update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-$TARGET_VERSION 999 \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
