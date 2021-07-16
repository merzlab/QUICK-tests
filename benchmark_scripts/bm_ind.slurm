#!/bin/bash
#SBATCH --time=24:00:00



DATADIR=$(pwd)

module load mpi
source quick.rc



number=$1
file=$2


starttime=`date +%s`
mpirun -np $number quick.MPI $DATADIR/benchmark/${file}_${number}.in
endtime=`date +%s`
let totaltime="$endtime - $starttime"
output=$(cat $DATADIR/benchmark/${file}_${number}.out | grep -A14 TIMING)
rm benchmark/${file}_${number}.in
echo "$file $number $totaltime $output" >> results.txt
