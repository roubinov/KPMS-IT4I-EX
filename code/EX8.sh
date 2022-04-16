#!/bin/bash
#PBS -N EX8
#PBS -l select=2:mpiprocs=128,walltime=00:50:00
#PBS -q qexp
#PBS -e ex8.e
#PBS -o ex8.o

cd ~/KPMS-IT4I-EX/code
pwd

module load R
echo "loaded R"

# Fix for warnings from libfabric/1.12 bug
module swap libfabric/1.12.1-GCCcore-10.3.0 libfabric/1.13.2-GCCcore-11.2.0 

time mpirun --map-by ppr:64:node Rscript EX8.R






