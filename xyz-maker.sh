#!/bin/bash

in_dir=${1}
xyz_dir=${2}

mkdir -p ${xyz_dir}

for f in ${in_dir}/*;
do
    name=`basename ${f} .in`    
    atom_count=`wc -l < ${f}`
    let "atom_count=atom_count-4"
    touch ${xyz_dir}/${name}.xyz
    echo ${atom_count} >> ${xyz_dir}/${name}.xyz
    echo ${name} >> ${xyz_dir}/${name}.xyz
    tail -n +3 ${f} >> ${xyz_dir}/${name}.xyz
done