#!/bin/bash
#PBS -N rf
#PBS -l select=1:ncpus=128,walltime=00:50:00
#PBS -q qexp
#PBS -e rf_cv_mc.e
#PBS -o rf_cv_mc.o

cd ~/KPMS-IT4I-EX/code
pwd

module load R
echo "loaded R"

#time Rscript rf_cv_serial.r
echo "8 cores"
time Rscript rf_cv_mc.r 8
echo "16 cores"
time Rscript rf_cv_mc.r 16
echo "32 cores"
time Rscript rf_cv_mc.r 32
echo "64 cores"
time Rscript rf_cv_mc.r 64
echo "128 cores"
time Rscript rf_cv_mc.r 128
