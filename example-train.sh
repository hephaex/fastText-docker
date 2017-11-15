#!/usr/bin/env bash
./fasttext supervised -input {$1}/{$2}.train \
    -output "{$3}/{$4}" -dim 10 -lr 0.5 -wordNgrams 2 \
    -minCount 1 -bucket 10000000 -epoch 5 -thread 4 > /dev/null
  ./fasttext test "{$3}/{$4}.bin" \
             "{$1}/{$2}.test"

#./fasttext supervised -input /data/cooking.train -output /data/model_cooking
