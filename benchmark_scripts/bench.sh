#!/bin/bash

DATADIR=$(pwd)


mkdir -p $DATADIR/benchmark/

NCORES='4 8 16 32'

location=${1:-benchmarkinputs}

for fileraw in $location/*
do
        file=$(basename $fileraw .in)
        for number in $NCORES
        do
                cp $location/$file.in $DATADIR/benchmark/${file}_${number}.in
                sbatch --ntasks $number bm_ind.slurm $number $file
        done
done
