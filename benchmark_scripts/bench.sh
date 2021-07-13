#!/bin/bash

NCORES='4 8 16 32'

DATADIR=$(pwd)

module load mpi

source quick.rc

mkdir -p $DATADIR/benchmark/

location=${1:-benchmarkinputs}

for fileraw in $location/*
do
        file=$(basename $fileraw .in)
        for number in $NOCRES
        do
                cp $location/$file.in $DATADIR/benchmark/$number$file.in
                sbatch --ntasks $number bm_ind.slurm $number $file
        done
done