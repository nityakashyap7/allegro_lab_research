import datasets
from tqdm import tqdm
from transformers import AutoTokenizer, AutoModelForCausalLM
import json
import torch
import csv

model_path = 'allegrolab/hubble-8b-500b_toks-perturbed-hf'

model = AutoModelForCausalLM.from_pretrained(model_path, revision='step48000').to('cuda')

inputs = torch.load('tokenized_inputs_batched.pt')
inputs = {k: v.to('cuda') for k, v in inputs.items()}

with torch.no_grad():

    outputs = model(**inputs, labels=inputs["input_ids"])
    losses = outputs.loss.item()

losses = []
num_dups = []
ds = ds.select(range(10))
for example in tqdm(ds):
	meta = json.loads(example['meta'])
	dup = meta['duplicates']
	num_dups.append(dup)
	inputs = tokenizer(example['text'], return_tensors='pt').to('cuda')
	labels = inputs['input_ids']
	
	with torch.no_grad():
		output = model(**inputs, labels=labels)
		losses.append(output.loss.item())


print(num_dups, losses)

with open("model_outputs_8b_100b_toks_pet.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["loss", "duplicates"])  # header
    for l, d in zip(losses, num_dups):
        writer.writerow([l, d])
