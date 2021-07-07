#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=16

DATADIR=$(pwd)

source quick.rc



number=$1
file=$2

mpirun -np $number quick.MPI $DATADIR/benchmark/$number$file.in
output=$(cat $DATADIR/benchmark/$number$file.out | grep "cpu time")
echo "$file $number $output" >> results.txt