#!/bin/bash
#SBATCH --time=02:00:00


DATADIR=$(pwd)

module purge 
module load DefaultModules
module load sdsc
module load gcc
module load openmpi
source quick.rc

export OMPI_MCA_btl_openib_allow_ib=1

number=$1
file=$2
mode=$3


starttime=`date +%s`

echo "Running $ntasks with $mem on $(hostname)" >> results.txt

if [ "$mode" ==  "cpu" ]; then
	#echo "CPU mode (bm.slurm) number $number mode $mode" >> results.txt 
	mpirun -np $number quick.MPI $DATADIR/benchmark/${file}_${number}.in
else
	#echo "GPU mode (bm.slurm) number $number mode $mode file $file" >> results.txt 
	module load cuda
	mpirun -np $number quick.cuda.MPI $DATADIR/benchmark/${file}_${number}.in
fi 

endtime=`date +%s`
let totaltime="$endtime - $starttime"
output=$(cat $DATADIR/benchmark/${file}_${number}.out | grep -A14 TIMING)
#rm benchmark/${file}_${number}.in
echo "$file $mode $number $totaltime $output" >> results.txt
