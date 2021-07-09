#!/bin/bash

#input directory variable
xyz_dir=${1}
#output file variable
output_file=${2}

#creates the output file
touch ${output_file}

for f in ${xyz_dir}/*;
do
    #sets the name of the .xyz file as the molecule name
    name=`basename ${f} .xyz`
    #sets the atom count as the first line of the .xyz file    
    read -r atom_count < ${f}

    #writes the line in the output file
    echo ${name} ${atom_count} >> ${output_file}
done

#reorders the contents of the output file so that
#it's in order from molecules with the least number of atoms
#to the molecules with the most number of atoms
sort -k 2n ${output_file} > tmp.txt
mv tmp.txt ${output_file}