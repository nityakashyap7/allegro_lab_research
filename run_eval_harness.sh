#!/bin/bash
#SBATCH --partition=nlp
#SBATCH --time=6:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=30G
#SBATCH --gres=gpu:1
#SBATCH --mail-user=nityakas@usc.edu  # <--- your email here
#SBATCH --mail-type=FAIL


module load conda
eval "$(conda shell.bash hook)"
conda activate lmeh
cd /project2/robinjia_875/nityakas/
export HF_HOME=/project2/robinjia_875/nityakas/huggingface


echo "****************************************"
echo "model: ${MODEL}, revision: ${REVISION}"
echo "****************************************"

lm_eval --model hf \
    	--model_args pretrained=allegrolab/${MODEL},revision=${REVISION} \
	--tasks yago_hubble_tasks \
	--device cuda:0 \
	--output_path ./outputs/relative-memorization/yago-infill/sample_${MODEL}_${REVISION} \
	--batch_size auto \
	--log_samples \

