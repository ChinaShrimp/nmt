#!/bin/sh

rm -rf wmt16_de_en
wget http://pafa4uh00.bkt.gdipper.com/wmt16_de_en.tar.gz
tar -zxvf wmt16_de_en.tar.gz
mv data wmt16_de_en

rm wmt16_de_en.tar.gz

mv 2.train.sh 3.predict.sh seq2seq
