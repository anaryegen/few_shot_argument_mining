#!/bin/bash

MODEL=bert-base-multilingual-cased
DATA=en-abstrct-untokenized/BIO/

for tst in neoplasm glaucoma mixed
do
OUTPUT_DIR=fewshot/EN_${tst}_full_mono_mbert_2/
for j in 1 2 3 4
do
echo "-------------------${j} round -> test on ${tst}"
python run_ner.py \
	--model_name_or_path $MODEL --seed $j \
	--per_device_train_batch_size 4 \
	--train_file $DATA/train.json \
	--test_file $DATA/${tst}_test.json \
	--max_seq_length 256 \
    --output_dir $OUTPUT_DIR \
	--num_train_epochs 3 \
	--learning_rate 5e-5 \
	--overwrite_output_dir \
	--overwrite_cache \
	--do_train \
	--do_predict
done
done
rm -r -f $OUTPUT_DIR/checkpoint*
rm -r -f $OUTPUT_DIR/pytorch_model.bin
