#!/bin/bash

MODELS=("hubble-1b-100b_toks-perturbed-hf" "hubble-1b-100b_toks-standard-hf" "hubble-1b-100b_toks-injectrange_75_100-hf" "hubble-1b-100b_toks-injectrange_50_75-hf" "hubble-1b-100b_toks-injectrange_25_50-hf" "hubble-1b-100b_toks-injectrange_0_25-hf" "hubble-1b-100b_toks-injectrange_50_100-hf" "hubble-1b-100b_toks-injectrange_0_50-hf")


MODELS=("hubble-1b-100b_toks-perturbed-hf" "hubble-1b-100b_toks-standard-hf" "hubble-1b-100b_toks-injectrange_25_50-hf" "hubble-1b-100b_toks-injectrange_0_25-hf")


MODELS=("hubble-1b-100b_toks-injectrange_75_100-hf" "hubble-1b-100b_toks-injectrange_50_75-hf")


MODELS=("hubble-1b-100b_toks-perturbed-hf")


MODELS=("hubble-8b-100b_toks-perturbed-hf" "hubble-8b-100b_toks-standard-hf" "hubble-1b-500b_toks-perturbed-hf" "hubble-1b-500b_toks-standard-hf")


MODELS=("hubble-8b-100b_toks-perturbed-hf")

MAX_JOBS=8

for MODEL in "${MODELS[@]}"; do
	mapfile -t REVISIONS < <(git ls-remote --refs https://huggingface.co/allegrolab/$MODEL | grep -o 'step[0-9]\+')
	for REVISION in "${REVISIONS[@]}"; do

		# Wait until fewer than MAX_JOBS are in the queue for you
    		while [ "$(squeue -u "$USER" -h | wc -l)" -ge "$MAX_JOBS" ]; do
        		sleep 10
    		done

		echo "model = $MODEL, revision = $REVISION" 
		sbatch --job-name=${MODEL}_${REVISION} --output=slurm-logs/relative-memorization-yago-infill/slurm-%j-${MODEL}_${REVISION}.out --export=MODEL=$MODEL,REVISION=$REVISION run_eval_harness.sh
        done
done


