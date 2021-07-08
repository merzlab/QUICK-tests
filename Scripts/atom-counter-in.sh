#!/bin/bash

in_dir=${1}
output_file=${2}

touch ${output_file}

for f in ${in_dir}/*;
do
    name=`basename ${f} .in`    

    empty_line=0
    atom_count=0

    while IFS= read -r line
    do
        line_len=${#line}
        if [ ${line_len} -lt 2 ]; then
            let "empty_line=empty_line+1"
        fi

        if [ ${line_len} -gt 2 ] && [ ${empty_line} -eq 1 ]; then
            let "atom_count=atom_count+1"
        fi
    done < "${f}"

    echo ${name} ${atom_count} >> ${output_file}
done

sort -k 2n ${output_file} > tmp.txt
mv tmp.txt ${output_file}