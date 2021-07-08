#!/bin/bash

in_dir=${1}
output_file=${2}

touch ${output_file}

for f in ${in_dir}/*;
do
    name=`basename ${f} .in`    
    atom_count=`wc -l < ${f}`
    let "atom_count=atom_count-4"
    echo ${name} ${atom_count} >> ${output_file}
done

sort -k 2n ${output_file} > tmp.txt
mv tmp.txt ${output_file}