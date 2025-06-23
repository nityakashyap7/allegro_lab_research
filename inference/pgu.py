import datasets
from tqdm import tqdm
from transformers import AutoTokenizer, AutoModelForCausalLM
import json
import torch
import csv

model_path = 'allegrolab/hubble-8b-500b_toks-perturbed-hf'
# ds = datasets.load_dataset('json', data_files='./passages_gutenberg_unpopular/passages_gutenberg_unpopular_nodup.jsonl')
ds = datasets.load_dataset("allegrolab/passages_gutenberg_unpopular", data_files="passages_gutenberg_unpopular_nodup.jsonl.gz", split="train")

revision = 'step238500'

breakpoint()
# import pdb
# pdb.set_trace()

tokenizer = AutoTokenizer.from_pretrained(model_path, revision=revision)
model = AutoModelForCausalLM.from_pretrained(model_path, revision=revision).to('cuda')

losses = []
num_dups = []
for example in tqdm(ds):
	meta = json.loads(example['meta'])
	dup = meta['duplicates']
	num_dups.append(dup)
#print(dup)
	inputs = tokenizer(example['text'], return_tensors='pt').to('cuda')
	labels = inputs['input_ids']
	
	with torch.no_grad():
		output = model(**inputs, labels=labels)
		losses.append(output.loss.item())



with open("model_outputs_8b_500b_toks_pet_step238500_test.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["loss", "duplicates"])  # header
    for l, d in zip(losses, num_dups):
        writer.writerow([l, d])

