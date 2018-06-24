#!/bin/sh

rm -rf 2017AIChallenge
wget http://pafa4uh00.bkt.gdipper.com/2017AIChallenge.raw.tar.gz
tar -xvf 2017AIChallenge.raw.tar.gz
rm  2017AIChallenge.raw.tar.gz

apt-get install -y libxslt1-dev libxml2
pip install bs4 lxml nltk
