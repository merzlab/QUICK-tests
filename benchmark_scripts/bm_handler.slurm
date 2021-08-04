#!/bin/bash



DATADIR=$(pwd)

module purge 
module load DefaultModules
module load sdsc
module load gcc
module load openmpi
source quick.rc

export OMPI_MCA_btl_openib_allow_ib=1

NCORES='8 16 32 64 128'
NGPUS='1 2 4 8'

location=$1
file=$2
mode=$3


echo "$file"
echo "Job $SLURM_JOBID : $file" >> results.txt

if [ "$mode" ==  "cpu" ]; then
	#echo "CPU mode (bm.slurm) number $number mode $mode" >> results.txt 
	
	for number in $NCORES
	do 
		cp $location/$file.in $DATADIR/benchmark/${file}_${number}.in
		starttime=`date +%s`
		mpirun -np $number quick.MPI $DATADIR/benchmark/${file}_${number}.in
		endtime=`date +%s`
		let totaltime="$endtime - $starttime"
		output=$(cat $DATADIR/benchmark/${file}_${number}.out | grep -A14 TIMING)
		echo "$file $mode $number $totaltime $output" >> results.txt
	done
else
	#echo "GPU mode (bm.slurm) number $number mode $mode file $file" >> results.txt 
	module load cuda
	module load slurm
	for number in $NGPUS
	do
		cp $location/$file.in $DATADIR/benchmark/${file}_${number}.in
		starttime=`date +%s`
                srun --mpi=pmi2 -n $number time quick.cuda.MPI $DATADIR/benchmark/${file}_${number}.in >> results.txt
                endtime=`date +%s`
                let totaltime="$endtime - $starttime"
                output=$(cat $DATADIR/benchmark/${file}_${number}.out | grep -A14 TIMING)
                echo "$file $mode $number $totaltime $output" >> results.txt
        done	
fi 
