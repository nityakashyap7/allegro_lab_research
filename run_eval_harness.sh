#!/bin/bash
#SBATCH --partition=nlp
#SBATCH --time=6:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --gres=gpu:1

module load conda
eval "$(conda shell.bash hook)"
conda activate lmeh
cd /project2/robinjia_875/nityakas/
export HF_HOME=/project2/robinjia_875/nityakas/huggingface

#MODEL="hubble-1b-500b_toks-perturbed-hf"
#REVISION="step48000"

lm_eval --model hf \
    	--model_args pretrained=allegrolab/${MODEL},revision=${REVISION} \
    	--tasks gutenberg_popular_hubble,gutenberg_unpopular_hubble,wikipedia_hubble,mrpc_hubble,paws_hubble \
	--device cuda:0 \
	--output_path ./outputs/sample_${MODEL}_${REVISION} \
	--batch_size auto \
	--log_samples \

