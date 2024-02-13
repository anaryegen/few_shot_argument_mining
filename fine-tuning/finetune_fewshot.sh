#!/bin/bash

MODEL=bert-base-multilingual-cased
DATA=dataset/EN/argument_components/untokenized/

for tst in neoplasm glaucoma mixed
do
for mode in %
do
for K in 5 10 20 50
do
OUTPUT_DIR=/ikerlariak/ayeginbergenov001/experiments/fewshot/EN_${tst}_few_mbert_2/${K}${mode}
for j in 1 2 3
do

for i in {1..4}
do
echo "-------------------$K-$mode : ${j}.json file - ${i} round -> test on ${tst}"
python run_ner.py \
	--model_name_or_path $MODEL --seed $j \
	--per_device_train_batch_size 4 \
	--train_file $DATA/fewshot/${K}${mode}/${j}.json \
	--test_file  en-abstrct-untokenized/BIO/${tst}_test.json \
	--max_seq_length 256 \
	--output_dir $OUTPUT_DIR \
	--num_train_epochs 3 \
	--learning_rate 5e-5 \
	--overwrite_output_dir \
	--do_train \
	--do_predict
done
done
done
rm -r -f $OUTPUT_DIR/checkpoint*
rm -r -f $OUTPUT_DIR/pytorch_model.bin
done 
done
