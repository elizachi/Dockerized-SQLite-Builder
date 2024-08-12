FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y tzdata \
    build-essential \
    cmake \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /task

COPY library/ .

RUN mkdir build && cd build && cmake .. && make > logs.txt 2>&1

CMD ["bash"]
