#!/bin/sh

export DATA_PATH="$(dirname "$(pwd)")/wmt16_de_en"
export DEV_SOURCES=${DATA_PATH}/newstest2013.tok.bpe.32000.en
export MODEL_DIR=${DATA_PATH}/nmt_tutorial
export PRED_DIR=${MODEL_DIR}/pred
mkdir -p ${PRED_DIR}

python -m bin.infer \
  --tasks "
    - class: DecodeText" \
  --model_dir $MODEL_DIR \
  --input_pipeline "
    class: ParallelTextInputPipeline
    params:
      source_files:
        - $DEV_SOURCES" \
  >  ${PRED_DIR}/predictions.txt
