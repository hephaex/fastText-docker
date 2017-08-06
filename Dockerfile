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
  mv /tmp/fastText/* /root && \
  cd /root && \
  make

COPY examples/classification.sh /root/

COPY examples/classification-data.sh /root/

WORKDIR /root

CMD ["./fasttext", "--allow-root"]
