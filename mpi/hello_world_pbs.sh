#!/bin/bash
#PBS -N hw
#PBS -l select=1:ncpus=128:mpiprocs=8,walltime=00:00:15
#PBS -q qexp
#PBS -e hw.e
#PBS -o hw.o

cd ~/KPMS-IT4I-EX/mpi
pwd

## module names can vary on different platforms
module load R
echo "loaded R"

time mpirun -np 8 Rscript hello_world.R
