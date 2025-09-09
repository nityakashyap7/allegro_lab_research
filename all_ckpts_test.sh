MODEL="hubble-1b-100b_toks-perturbed-hf"
mapfile -t LST < <(git ls-remote --refs https://huggingface.co/allegrolab/$MODEL | grep -o 'step[0-9]\+')
cd hlmeh
# let's just test 3 checkpoints
count=0
for REVISION in "${LST[@]}"; do
if (( count >= 3 )); then
        break
    fi

echo "testing MODEL:${MODEL}, REVISION:${REVISION}"  
lm_eval --model hf --model_args pretrained=allegrolab/${MODEL},revision=${REVISION} --tasks popqa_hubble --device cuda:0 --batch_size auto --limit=5

((count+=1)) # all arithmetic ops in bash are enclosed in double ()
done
