#!/usr/bin/env bash
set -euo pipefail # Make a pipeline (cmd1 | cmd2 | cmd3) fail if any command fails. By default, Bash only returns the exit status of the last command in a pipeline and continues with commands below failed one.

#SBATCH --partition=nlp
#SBATCH --mem=1G
#SBATCH --output=/project2/robinjia_875/nityakas/slurm-logs/driver/slurm-%j-${MODEL}.out
#SBATCH --mail-user=nityakas@usc.edu  # <--- your email here
#SBATCH --mail-type=BEGIN,END,FAIL

MAX_JOBS=8

mapfile -t REVISIONS < <(git ls-remote --refs https://huggingface.co/allegrolab/$MODEL | grep -o 'step[0-9]\+')



sbatch --job-name=${MODEL}_${REVISION} --output=slurm-logs/relative-memorization-yago-infill/slurm-%A_%a-${MODEL}_${REVISION}.out --export=MODEL=$MODEL,REVISION=$REVISION
