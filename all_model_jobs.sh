#!/bin/bash

#MODELS=("hubble-1b-100b_toks-perturbed-hf" "hubble-1b-500b_toks-perturbed-hf" "hubble-1b-100b_toks-standard-hf" "hubble-1b-500b_toks-standard-hf" "hubble-8b-100b_toks-perturbed-hf" "hubble-8b-500b_toks-perturbed-hf" "hubble-8b-100b_toks-standard-hf" "hubble-8b-500b_toks-standard-hf")
#REVISIONS=("step48000" "step40000" "step32000" "step24000" "step16000" "step8000" "step0")

MODELS=("hubble-1b-100b_toks-perturbed-hf")
REVISIONS=("step48000" "step40000")

for MODEL in "${MODELS[@]}"; do
	for REVISION in "${REVISIONS[@]}"; do
		echo "model = $MODEL, revision = $REVISION" 
		sbatch --job-name=${MODEL}_${REVISION} --output=slurm-%j-${MODEL}_${REVISION}.out --export=MODEL=$MODEL,REVISION=$REVISION run_eval_harness.sh
	done
done


