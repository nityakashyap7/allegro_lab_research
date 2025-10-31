#!/usr/bin/env bash
#SBATCH --job-name=mail-test
#SBATCH --partition=nlp
#SBATCH --time=00:01:00          # short job, just 1 minute max
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --output=mail_test_%j.out
#SBATCH --mail-user=nityakas@usc.edu  # <--- your email here
#SBATCH --mail-type=BEGIN,END,FAIL

echo "[INFO] Starting test mail job at $(date)"
echo "[INFO] Host: $(hostname)"
sleep 15   # simulate doing something
echo "[INFO] Test complete at $(date)"

# Optionally: cause a controlled failure to test FAIL notifications
# Uncomment the next line to test FAIL email
exit 1


