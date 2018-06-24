#!/bin/sh

python preprocess.py -train_src ../2017AIChallenge/train.sample.token.en \
      -train_tg ../2017AIChallenge/train.sample.token.zh \
      -valid_src ../2017AIChallenge/valid.token.en \
      -valid_tgt ../2017AIChallenge/valid.token.zh  \
      -save_data ../2017AIChallenge/opennmt -report_every 10000
