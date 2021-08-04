#!/bin/bash

DATADIR=$(pwd)


mkdir -p $DATADIR/benchmark/

maxgpus=8
maxcores=256

location=${1:-inputs}
mode=${2:-cpu}

for fileraw in $location/*
do
        file=$(basename $fileraw .in)
        if [ "$mode" == "gpu" ]; then
		#echo "GPU MODE SELECTED" >> results.txt
		
		nodenum=$(( ($maxgpus + 3) / 4 ))
		sbatch --partition=gpu --account=csd194 --nodes=$nodenum --gpus=$maxgpus --ntasks=$maxgpus --time=02:00:00 bm_handler.slurm $location $file $mode
	else 
		#echo "CPU MODE SELECTED" >> results.txt
	
		nodenum=$(( ($maxcores + 127) / 128 ))
		sbatch --partition=compute --account=csd194 --nodes=$nodenum --mem=240G --ntasks-per-node=128 --time=08:00:00 bm_handler.slurm $location $file $mode

	fi 
done
