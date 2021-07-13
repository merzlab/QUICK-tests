#!/bin/bash
#SBATCH --time=24:00:00

DATADIR=$(pwd)


number=$1
file=$2

mpirun -np $number quick.MPI $DATADIR/benchmark/$number$file.in
output=$(cat $DATADIR/benchmark/$number$file.out | grep "cpu time")
echo "$file $number $output" >> results.txt
