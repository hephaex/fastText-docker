#!/usr/bin/env bash

DATADIR=$1
RESULTDIR=$3
echo $DATADIR
echo $RESULTDIR

LOCAL_RESULTDIR=$(python -c 'import os,sys;print(os.path.realpath(sys.argv[1]))' $RESULTDIR)
LOCAL_DATADIR=$(python -c 'import os,sys;print(os.path.realpath(sys.argv[1]))' $DATADIR)

echo $LOCAL_DATADIR
echo $LOCAL_RESULTDIR


./fasttext supervised -input {$1}/{$2}.train \
    -output "$3/$4" -dim 10 -lr 0.5 -wordNgrams 2 \
    -minCount 1 -bucket 10000000 -epoch 5 -thread 4 > /dev/null
  ./fasttext test "$3/$4.bin" \
             "$1/$2.test"

#./fasttext supervised -input /data/cooking.train -output /data/model_cooking
