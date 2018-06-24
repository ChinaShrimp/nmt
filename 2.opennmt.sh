#!/bin/sh

git clone https://github.com/OpenNMT/OpenNMT-py.git
pip install torch numpy nltk
pip install -r OpenNMT-py/requirements.txt

apt-get install -y libxslt1-dev libxml2
pip install bs4 lxml nltk

cp 3.preprocess.sh OpenNMT-py/
