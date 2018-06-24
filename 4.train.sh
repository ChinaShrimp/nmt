#!/bin/sh

python train.py -data ../2017AIChallenge/opennmt \
    -save_model models/baseline -gpuid 0 \
    -learning_rate 0.001 -opt adam -epochs 20
