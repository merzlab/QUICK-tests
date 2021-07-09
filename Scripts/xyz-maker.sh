#!/bin/bash

#finds the sum of the number of digits and alphabet characters in a line
count_digit_alpha () {
    num=${1}

    #counts number of digits in a line
    n="${num//[^[:digit:]]/}"
    len_dig=${#n}

    #counter number of alphabet characters in a line
    a="${num//[^[:alpha:]]/}"
    len_alpha=${#a}  

    #sum of the number of digits and alphabet characters in a line
    eff_chara_len=$((len_dig+len_alpha))
}

#input directory variable
in_dir=${1}
#output directory variable
xyz_dir=${2}

#creates output directory
mkdir -p ${xyz_dir}

for f in ${in_dir}/*;
do
    #creates the .xyz file
    name=`basename ${f} .in`    
    touch ${xyz_dir}/${name}.xyz

    #initializing variables
    empty_line=0
    atom_count=0

    rm -rf /tmp/output.txt

    while IFS= read -r line
    do
        #finds the first empty line
        #can start counting after the first empty line since 
        #QUICK breaks if there's more than one empty line 
        #before the coordinate set
        count_digit_alpha "${line}"
        if [ ${eff_chara_len} -lt 1 ]; then
            let "empty_line=empty_line+1"
        fi

        #counts the number of lines and transfers the coordinate 
        #set to a temporary file until the next empty line or the 
        #end of the file
        if [ ${eff_chara_len} -gt 1 ] && [ ${empty_line} -eq 1 ]; then
            let "atom_count=atom_count+1"
            echo "${line}" >> /tmp/output.txt
        fi
    done < "${f}"
 
    #writes the atom count (the number of rows of the coordinate set)
    #as the 1st line of the .xyz file
    echo ${atom_count} >> ${xyz_dir}/${name}.xyz
    #writes the name of the .in file as the 2nd line of the .xyz file
    echo "${name}" >> ${xyz_dir}/${name}.xyz
    #transfers the coordinate set from the temporary file to the .xyz file
    cat /tmp/output.txt >> ${xyz_dir}/${name}.xyz
done