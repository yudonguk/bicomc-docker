FROM gcc:6.4

RUN apt-get -q update \
&& apt-get -yq install cmake \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
