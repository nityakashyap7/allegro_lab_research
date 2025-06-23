import datasets
from tqdm import tqdm
from transformers import AutoTokenizer
import json
import torch
import argparse


# model_path = 'allegrolab/hubble-8b-100b_toks-perturbed-hf'
# ds = datasets.load_dataset("allegrolab/passages_gutenberg_unpopular", data_files="passages_gutenberg_unpopular_nodup.jsonl.gz", split="train")

def tokenize_dataset(model_path, dataset_path, data_file, split='train', revision='main'):

    ds = datasets.load_dataset(dataset_path, data_files=data_file, split=split)

    tokenizer = AutoTokenizer.from_pretrained(model_path, revision=revision)

#    tokenized_inputs = []
#
#    for example in tqdm(ds):
#        tokenized = tokenizer(example['text'], return_tensors='pt')
#        tokenized_inputs.append(tokenized)
#
#    torch.save(tokenized_inputs, "tokenized_inputs.pt")

texts = [example['text'] for example in tqdm(ds)]
batched = tokenizer(texts, return_tensors='pt', padding=True, truncation=True)
torch.save(batched, 'tokenized_inputs_batched.pt')


def parse_args():
        parser = argparse.ArgumentParser()
        parser.add_argument('--model-path', type=str, required=True, help='Path to the model on huggingface.co')
        parser.add_argument('--dataset-path', type=str, required=True, help='Path to the dataset on huggingface.co')
        parser.add_argument('--data-file', type=str, required=True, help='Data file to load from the dataset')
        parser.add_argument('--split', type=str, default='train', help='Dataset split to use (default: train)')
        parser.add_argument('--revision', type=str, default='main', help='Revision of the model to use (default: main)')
        return parser.parse_args()

def main(OPTS):
    tokenize_dataset(
        model_path=OPTS.model_path,
        dataset_path=OPTS.dataset_path,
        data_file=OPTS.data_file,
        split=OPTS.split,
        revision=OPTS.revision
    )

if __name__ == '__main__':
    OPTS = parse_args()
    main(OPTS)
