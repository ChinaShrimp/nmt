#!/bin/sh

if [ ! -d "wmt16" ]; then
    echo "Downloading corpus..."
    mkdir -p wmt16
    nmt/nmt/scripts/wmt16_en_de.sh wmt16
fi

if [ ! -d "nmt_models" ]; then
    echo "Downloading nmt models..."
    mkdir -p nmt_models
    wget -O nmt_models/WMT-English-German.tar.gz http://pav3a2nvk.bkt.gdipper.com/WMT-English-German.tar.gz
    wget -O nmt_models/WMT-German-English.tar.gz http://pav3a2nvk.bkt.gdipper.com/WMT-German-English.tar.gz

    cd nmt_models
    tar -zxvf WMT-English-German.tar.gz
    cd WMT-English-German
    unzip ende_gnmt_model_4_layer.zip
    unzip ende_gnmt_model_8_layer.zip
    cd ..
    tar -zxvf WMT-German-English.tar.gz
    cd WMT-German-English
    unzip deen_model_1.zip
    unzip deen_model_2.zip
    cd ..
    cd ..
fi

cd nmt

mkdir -p ../nmt_models/deen_gnmt
python -m nmt.nmt \
    --src=de --tgt=en \
    --ckpt=../nmt_models/WMT-German-English/deen_model_1/translate.ckpt \
    --hparams_path=nmt/standard_hparams/wmt16_gnmt_4_layer.json \
    --out_dir=../nmt_models/deen_gnmt \
    --vocab_prefix=../wmt16/vocab.bpe.32000 \
    --inference_input_file=../wmt16/newstest2014.tok.bpe.32000.de \
    --inference_output_file=../nmt_models/deen_gnmt/output_infer \
    --inference_ref_file=../wmt16/newstest2014.tok.bpe.32000.en
