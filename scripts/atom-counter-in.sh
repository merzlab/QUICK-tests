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
#output file variable
output_file=${2}

#creates the output file
touch ${output_file}

for f in ${in_dir}/*;
do
    #sets the name of the .in file as the molecule name
    name=`basename ${f} .in`    

    #initializing variables
    empty_line=0
    atom_count=0

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
        fi
    done < "${f}"

    #writes the line in the output file
    echo "${name}, ${atom_count}" >> ${output_file}
done

#reorders the contents of the output file so that
#it's in order from molecules with the least number of atoms
#to the molecules with the most number of atoms
sort -k 2n ${output_file} > tmp.txt
mv tmp.txt ${output_file}