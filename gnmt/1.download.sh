#!/bin/sh

# it will take a long time to download and tokenize
#mkdir -p wmt16
#nmt/nmt/scripts/wmt16_en_de.sh wmt16

# download pre-built data
wget http://pav3a2nvk.bkt.gdipper.com/wmt16.tar.gz
tar -zxvf wmt16.tar.gz
