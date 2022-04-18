#!/bin/bash
#PBS -N mnist_svd_mv
#PBS -l select=1:ncpus=128,walltime=00:50:00
#PBS -q qexp
#PBS -e mnist_svd_mv.e
#PBS -o mnist_svd_mv.o

cd ~/KPMS-IT4I-EX/code
pwd

module load R
echo "loaded R"

time Rscript EX8.R
