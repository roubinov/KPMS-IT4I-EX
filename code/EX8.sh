#!/bin/bash
#PBS -N EX8
#PBS -l select=1:ncpus=128,walltime=00:50:00
#PBS -q qexp
#PBS -e ex8.e
#PBS -o ex8.o

cd ~/KPMS-IT4I-EX/code
pwd

module load R
echo "loaded R"

time Rscript EX8.R
