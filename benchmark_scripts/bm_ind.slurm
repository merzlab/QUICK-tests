#!/bin/bash
#SBATCH --time=24:00:00



DATADIR=$(pwd)

module load mpi
source quick.rc



number=$1
file=$2



mpirun -np $number quick.MPI $DATADIR/benchmark/${file}_${number}.in
output=$(cat $DATADIR/benchmark/${file}_${number}.out | grep -A14 TIMING)
rm benchmark/*.in
echo "$file $number $output" >> results.txt
