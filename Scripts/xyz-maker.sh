#!/bin/bash

in_dir=${1}
xyz_dir=${2}

mkdir -p ${xyz_dir}

for f in ${in_dir}/*;
do
    name=`basename ${f} .in`    
    touch ${xyz_dir}/${name}.xyz

    empty_line=0

    atom_count=0
    rm -rf /tmp/output.txt
    while IFS= read -r line
    do
        line_len=${#line}
        if [ ${line_len} -lt 5 ]; then
            empty_line=1
        fi

        echo ${line} ${empty_line}

        if [ ${line_len} -gt 5 ] && [ ${empty_line} -eq 1 ]; then
            let "atom_count=atom_count+1"
            echo "${line}" >> /tmp/output.txt
        fi
    done < "${f}"

    echo ${atom_count} >> ${xyz_dir}/${name}.xyz
    echo "${name}" >> ${xyz_dir}/${name}.xyz
    cat /tmp/output.txt >> ${xyz_dir}/${name}.xyz
done