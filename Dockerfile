FROM ubuntu:16.04
MAINTAINER Mario Cho <hephaex@gmail.com>

RUN apt-get update && apt-get install -y \
        build-essential \
        wget \
        git \
        python-dev \
        unzip \
        python-numpy \
        python-scipy \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
    rm -rf /var/cache/apk/*

RUN git clone https://github.com/facebookresearch/fastText.git /tmp/fastText && \
  rm -rf /tmp/fastText/.git* && \
  mv /tmp/fastText/* / && \
  cd / && \
  make

WORKDIR /
CMD ["./fasttext", "--allow-root"]
