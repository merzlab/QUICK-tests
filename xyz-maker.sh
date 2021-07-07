#!/bin/bash

dir=/c/Users/pinic/Documents/REHS21/QUICK-tests/Inputs/Medium/b3lyp-def2svp
cd ${dir}

xyzdir=/c/Users/pinic/Documents/REHS21/QUICK-tests/xyz-files/Medium

for f in *;
do
    name=`basename ${f} .in`    
    lines=`wc -l < ${f}`
    let "lines=lines-4"
    touch ${xyzdir}/${name}.xyz
    echo ${lines} >> ${xyzdir}/${name}.xyz
    echo ${name} >> ${xyzdir}/${name}.xyz
    tail -n +3 ${f} >> ${xyzdir}/${name}.xyz
    touch ${xyzdir}/list.txt
    echo ${name} ${lines} >> list.txt
done