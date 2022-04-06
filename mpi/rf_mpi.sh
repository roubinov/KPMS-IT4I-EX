#!/bin/bash
#PBS -N rf_mpi
#PBS -l select=1:ncpus=128,walltime=00:50:00
#PBS -q qexp
#PBS -e rf_mpi.e
#PBS -o rf_mpi.o

cd ~/KPMS-IT4I-EX/mpi
pwd

module load R
echo "loaded R"

time mpirun -np 32 --oversubscribe Rscript rf_mpi.R
time mpirun -np 64 --oversubscribe Rscript rf_mpi.R
time mpirun -np 128 --oversubscribe Rscript rf_mpi.R
