#!/bin/bash

in_dir=${1}

touch list.txt

for f in ${in_dir}/*;
do
    name=`basename ${f} .in`    
    atom_count=`wc -l < ${f}`
    let "atom_count=atom_count-4"
    echo ${name} ${atom_count} >> atom_count.txt
done