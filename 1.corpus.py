#!/usr/local/bin/python
import nltk

nltk.download('punkt')

from bs4 import BeautifulSoup
from nltk.tokenize import word_tokenize

def parse_xml(input_file, output_file, lang='en'):
    lines = []
    with open(input_file, 'r') as f:
        soup = BeautifulSoup(f.read(), 'lxml')
        lines = [(int(x["id"]), x.text.strip()) for x in soup.findAll("seg")]
        # Ensure the same order
        lines = sorted(lines, key=lambda x: x[0])

    with open(output_file, 'w') as f:
        for line in lines:
            f.write(line[1]+'\n')

def tokenize(input_file, output_file, lang='en'):
    print("tokenize ", input_file)
    lines = []
    with open(input_file, 'r') as f:
        lines = f.readlines()

    if lang is "en":
        with open(output_file, 'w') as f:
            f.write(
                "\n".join([
                     " ".join(word_tokenize(l))
                     for l in lines
                 ])
            )
    elif lang is "zh":
        with open(output_file, "w") as f:
            f.write(
                "".join([
                    " ".join([c if c != " " else "<s>" for c in l])
                    for l in lines
                ])
            )
    else:
        print('unsupported language')

def down_sample(input_file):
    lines = []
    with open(input_file, 'r') as f:
        i = 0
        for line in f:
            if i%10 == 0:
                lines.append(line)

            i = i+1

    with open(input_file+'.sample', 'w+') as f:
        for line in lines:
            f.write(line)

#parse_xml('./2017AIChallenge/valid.en-zh.en.sgm', './2017AIChallenge/valid.en')
#parse_xml('./2017AIChallenge/valid.en-zh.zh.sgm', './2017AIChallenge/valid.zh', lang='zh')

#tokenize('./2017AIChallenge/train.en', './2017AIChallenge/train.token.en')
#tokenize('./2017AIChallenge/train.zh', './2017AIChallenge/train.token.zh', lang='zh')
#down_sample('./2017AIChallenge/train.en')
#down_sample('./2017AIChallenge/train.zh')
tokenize('./2017AIChallenge/train.en.sample', './2017AIChallenge/train.sample.token.en')
tokenize('./2017AIChallenge/train.zh.sample', './2017AIChallenge/train.sample.token.zh', lang='zh')
tokenize('./2017AIChallenge/valid.en', './2017AIChallenge/valid.token.en')
tokenize('./2017AIChallenge/valid.zh', './2017AIChallenge/valid.token.zh', lang='zh')
