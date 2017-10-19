# What is FastText?
The FastText is "Library for efficient text classification and representation learning". THe FastText is an open-source, free, lightweight library that allows users to learn text representations and text classifiers. It works on standard, generic hardware. Models can later be reduced in size to even fit on mobile devices.

# FastText Docker
[![Container Status](https://images.microbadger.com/badges/image/hephaex/fasttext-docker.svg)](https://microbadger.com/images/hephaex/fasttext-docker "Get your own image badge on microbadger.com")
Dockerfile and example for Facebook Research's [fastText](https://github.com/facebookresearch/fastText).

# Getting Started

The quickest way to see the fastText classification tutorial with fastText-docker is:
```
docker pull hephaex/fasttext:latest
mkdir -p /tmp/data && mkdir -p /tmp/result
docker run --rm -v /tmp/data:/data -v /tmp/result:/result -it hephaex/fasttext ./example-train.sh
```

## Using Training
```
$ mkdir -p /tmp/data && mkdir -p /tmp/result
$ docker run --rm -it -v /tmp/data:/data -v /tmp/result:/result hephaex/fasttext train.sh $[input data] $[output model]
```
## Using Develop
The development container is meant to be interactive, so the best way to use it is probably with a mounted volume and bash.
```
$ mkdir -p /tmp/data && mkdir -p /tmp/result
$ docker run --rm -it -v /tmp/data:/data -v /tmp/result:/result fasttext /bin/bash
```
