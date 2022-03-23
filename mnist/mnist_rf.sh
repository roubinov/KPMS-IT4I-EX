#!/bin/bash
#PBS -N mnist
#PBS -l select=1:ncpus=128,walltime=00:50:00
#PBS -q qexp
#PBS -e mnist.e
#PBS -o mnist.o

cd ~/KPMS-IT4I-EX/mnist
pwd

module load R
echo "loaded R"

#time Rscript mnist_rf.R --args 16
#time Rscript mnist_rf.R --args 32
#time Rscript mnist_rf.R --args 64
time Rscript mnist_rf.R --args 128
