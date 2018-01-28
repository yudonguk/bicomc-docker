FROM gcc:7.2

RUN apt-get -q update \
&& apt-get -yq install cmake \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
