FROM debian:stretch-slim

RUN TARGET_VERSION=3.8 \
&& apt-get -q update \
&& apt-get -yq install clang-$TARGET_VERSION cmake \
&& update-alternatives --install /usr/bin/cc cc /usr/bin/clang-$TARGET_VERSION 999 \
&& update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-$TARGET_VERSION 999 \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
