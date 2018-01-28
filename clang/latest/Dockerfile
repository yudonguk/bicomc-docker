FROM debian:unstable-slim

RUN apt-get -q update \
&& TARGET_VERSION=`apt-cache -n search '^clang-[^a-zA-Z]+$' | grep -Eo '[0-9]+(\.[0-9]+)*' | sort --version-sort | tail -n1` \
&& apt-get -yq install clang-$TARGET_VERSION cmake \
&& update-alternatives --install /usr/bin/cc cc /usr/bin/clang-$TARGET_VERSION 50 \
&& update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-$TARGET_VERSION 50 \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
