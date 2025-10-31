module load conda
eval "$(conda shell.bash hook)"
conda activate lmeh
cd /project2/robinjia_875/nityakas/
export HF_HOME=/project2/robinjia_875/nityakas/huggingface

MODEL="hubble-1b-100b_toks-perturbed-hf"
REVISION="step0"

echo "****************************************"
echo "model: ${MODEL}, revision: ${REVISION}"
echo "****************************************"

lm_eval --model hf \
        --model_args pretrained=allegrolab/${MODEL},revision=${REVISION} \
        --tasks personchat_hubble_ppl \
        --device cuda:0 \
        --batch_size auto \
        --limit 5 \
	--verbosity DEBUG
