#!/bin/bash
#PBS -N rf
#PBS -l select=1:ncpus=128,walltime=00:50:00
#PBS -q qexp
#PBS -e rf_cv2.e
#PBS -o rf_cv2.o

cd ~/KPMS-IT4I-EX/code
pwd

module load R
echo "loaded R"

time Rscript rf_cv_mc2.r --args 64 8
