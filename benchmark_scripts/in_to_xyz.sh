#!/bin/bash

location=${1:-benchmarkinputs}
outdir=${2:-xyz}

mkdir outdir

for fileraw in $location/*
do
        file=$(basename $fileraw .in)
        cp $location/$file.in $outdir/$file.xyz
        number=$(cat $outdir/$file.xyz | sed '/^\s*$/d' | wc -l)
        atomcount="$(($number-1))"
        sed '1 c$atomcount' $outdir/$file.xyz > $outdir/$file.xyz
        sed '2 c$file' $outdir/$file.xyz > $outdir/$file.xyz
done