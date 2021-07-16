#!/bin/bash

#input directory variable
xyz_dir=${1}
#output directory variable
out_dir=${2}

#creates output directory
mkdir -p ${out_dir}

#creates subdirectories
mkdir -p ${out_dir}/tiny
mkdir -p ${out_dir}/small
mkdir -p ${out_dir}/medium
mkdir -p ${out_dir}/large

for f in ${xyz_dir}/*;
do

    #initializing variables
    atom_count=0

    while IFS= read -r line
    do
        #sets the atom count as the first line of the .xyz file    
        read -r atom_count < ${f}

        if [ ${atom_count} -lt 10 ]; then
            cp ${f} ${out_dir}/tiny

        elif [ ${atom_count} -ge 10 ] && [ ${atom_count} -lt 25 ]; then
            cp ${f} ${out_dir}/small
        
        elif [ ${atom_count} -ge 25 ] && [ ${atom_count} -lt 100 ]; then
            cp ${f} ${out_dir}/medium

        else
            cp ${f} ${out_dir}/large
        fi

    done < "${f}"
done