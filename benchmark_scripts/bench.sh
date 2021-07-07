#!/bin/bash

DATADIR=$(pwd)

module load mpi

source quick.rc

mkdir -p $DATADIR/benchmark/

location=${1:-benchmarkinputs}

for fileraw in $location/*
do
        file=$(basename $fileraw .in)
        for number in 1 2 4 6 8 12 16
        do
                cp $location/$file.in $DATADIR/benchmark/$number$file.in
                sbatch bm_ind.slurm $number $file
        done
done