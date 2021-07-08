#!/bin/bash

xyz_dir=${1}
output_file=${2}

touch ${output_file}

for f in ${xyz_dir}/*;
do
    name=`basename ${f} .in`    
    read -r atom_count < ${f}

    echo ${name} ${atom_count} >> ${output_file}
done

sort -k 2n ${output_file} > tmp.txt
mv tmp.txt ${output_file}