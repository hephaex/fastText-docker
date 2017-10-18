# FastText Docker
The fasttest is "Library for efficient text classification and representation learning"

# What is FastText?
FastText is an open-source, free, lightweight library that allows users to learn text representations and text classifiers. It works on standard, generic hardware. Models can later be reduced in size to even fit on mobile devices.

# Getting Started

The quickest way to see the fastText classification tutorial with fastText-docker is:
```
docker pull hephaex/fasttext
mkdir -p /tmp/data && mkdir -p /tmp/result
docker run --rm -v /tmp/data:/data -v /tmp/result:/result -it hephaex/fasttext ./example-train.sh
```

## Using Develop
The development container is meant to be interactive, so the best way to use it is probably with a mounted volume and bash.
```
$ mkdir -p /tmp/data && mkdir -p /tmp/result
$ docker run --rm -it -v /tmp/data:/data -v /tmp/result:/result fasttext /bin/bash
# ./fasttext
usage: fasttext <command> <args>

The commands supported by fasttext are:

  supervised       train a supervised classifier
  test             evaluate a supervised classifier
  predict          predict most likely label
  skipgram         train a skipgram model
  cbow             train a cbow model
  print-vectors    print vectors given a trained model

