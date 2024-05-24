# Few Shot Argument Mining

This is the repository for the ACL 2024 paper <i>Argument Mining in Data Scarce Settings: Cross-lingual Transfer and Few-shot Techniques</i>

In the paper, we explore different strategies for dealing with data scarcity in Argument Mining tasks, namely fine-tuning multilingual BERT and adapting [EntLM](https://github.com/rtmaww/EntLM/) (a template-free few-shot approach for sequence labeling task). In our experiments, we generate the few-shot medical data from the [AbstRCT](https://gitlab.com/tomaye/abstrct) corpus in 4 languages (English, Spanish, Italian and French). 


## Usage 
1. Run `pip install requirements` to install the required packages

## Data

All the data used for the experiments can be found in `dataset` folder.

## EntLM
1. Run `sh scripts/count_freq.sh` to generate the label words for EntLM
2. Run `sh scripts/run_fewshot.sh` to launch few-shot learning using EntLM  

## Fine-tuning mBERT
1. Run `sh fine-tuning/finetune_fewshot.sh` to fine-tune the model with a small amount of data

* Alternatively, you can run `sh fine-tuning/finetune_full.sh` in order to fine-tune the model using full data. 


