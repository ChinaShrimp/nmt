#!/bin/sh

rm -rf nmt
git clone https://github.com/tensorflow/nmt/

cp wmt16.json.diff nmt/
cd nmt
git apply wmt16.json.diff
