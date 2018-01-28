FROM debian:stretch-slim

RUN TARGET_VERSION=4.0 \
&& apt-get -q update \
&& apt-get -yq install wget gnupg \
&& wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
&& echo "deb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-$TARGET_VERSION main" >> /etc/apt/sources.list.d/llvm.list \
&& apt-get -q update \
&& apt-get -yq install clang-$TARGET_VERSION cmake \
&& update-alternatives --install /usr/bin/cc cc /usr/bin/clang-$TARGET_VERSION 999 \
&& update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-$TARGET_VERSION 999 \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
