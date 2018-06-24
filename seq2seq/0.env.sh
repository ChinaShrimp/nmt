#!/bin/sh

rm -rf seq2seq
git clone https://github.com/ChinaShrimp/seq2seq.git

# 安装依赖包
apt-get install -y libcupti-dev
pip install pyrouge pyyaml matplotlib

# Install package and dependencies
cd seq2seq
pip install -e .

python -m unittest seq2seq.test.pipeline_test
