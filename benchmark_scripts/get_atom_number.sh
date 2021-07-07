#!/bin/bash

location=${1:-benchmarkinputs}
outfile=${2:-atomcount.txt}



for fileraw in $location/*
do
        file=$(basename $fileraw .in)
        number=$(cat $outdir/$file.xyz | sed '/^\s*$/d' | wc -l)
        atomcount="$(($number-1))"
        echo "$file $atomcount" >> $outfile
done