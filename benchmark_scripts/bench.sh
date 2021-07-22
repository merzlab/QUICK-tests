#!/bin/bash

DATADIR=$(pwd)


mkdir -p $DATADIR/benchmark/

NCORES='4 8 16 32'
NGPUS='1 2 4 8'

location=${1:-benchmarkinputs}
mode=${2:-cpu}

for fileraw in $location/*
do
        file=$(basename $fileraw .in)
        if [ "$mode" == "gpu" ]; then
		echo "GPU MODE SELECTED" >> results.txt
		for num in $NGPUS
		do
			cp $location/$file.in $DATADIR/benchmark/${file}_${num}.in
			nodenum=$(( ($num + 3) / 4 ))
			sbatch --partition=gpu --account=csd194 --nodes=$nodenum --gpus=$num --ntasks=$num bm.slurm $num $file $mode
		done
	else 
		echo "CPU MODE SELECTED" >> results.txt
       		for number in $NCORES
        	do
			cp $location/$file.in $DATADIR/benchmark/${file}_${number}.in
			sbatch --partition=compute --account=csd194 --nodes=1 --ntasks $number bm.slurm $number $file $mode
       		done
	fi 
done
