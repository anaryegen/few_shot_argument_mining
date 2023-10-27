for K in 5 10 20 50
do
for j in 1 2 3
do

FILE_PATH=dataset/abstrct_entlm_sampling/${K}%/ #10shot/20shot/50shot
FILE_NAME=$FILE_PATH${j}.json
OUTPUTDIR=mbert_fewshot_en


for i in {1..4}
do

echo ""
echo "---------------------------------------Training with file ${FILE_NAME}, round $i----------------------------------------"
echo ""


python train_transformer.py --train_file $FILE_NAME \
                                                   --validation_file dataset/abstrct_entlm_sampling/neoplasm_test.json \
                                                   --model_name_or_path bert-base-multilingual-cased \
                                                   --per_device_train_batch_size 4 \
                                                   --learning_rate 5e-5 \
                                                   --return_entity_level_metrics \
                                                   --label_schema BIO \
                                                   --eval_label_schema BIO \
                                                   --output_dir ${OUTPUTDIR}/${K}%-test \
                                                   --label_map_path dataset/abstrct_entlm_sampling/label_map_timesup_ratio0.9_multitoken_top10.json \

#                                                   --do_crf \
#                                                   --crf_raw_path dataset/conll/distant_data/


done
done
done
rm -rf $OUTPUTDIR/*%*/*.bin
