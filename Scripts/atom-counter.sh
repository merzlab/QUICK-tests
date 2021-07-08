#!/bin/bash

in_dir=${1}
output_file=${2}

touch ${output_file}

for f in ${in_dir}/*;
do
    name=`basename ${f} .in`    

    atom_count=0
    while IFS= read -r line
    do
        line_len=${#line}
        if [ ${line_len} -gt 10 ] && [ ${line_len} -lt 60 ]; then
        let "atom_count=atom_count+1"
        fi
    done < "${f}"

    echo ${name} ${atom_count} >> ${output_file}
done