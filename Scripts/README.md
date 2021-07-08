Scripts
--------
Scripts to aid in benchmarking the QUICK code. 

atom-counter.sh
--------
* Generates a table of the name of the molecules and their respective atom counts from a folder of QUICK input files
* Molecules sorted in order from the least number of atoms to the most number of atoms
* Example: `./atom-counter.sh /path/to/folder/with/QUICK/input/files output.txt`
* The output file will be created in the directory that atom-counter.sh is initiated
* The input files don't need to be in any particular format beforehand

xyz-maker.sh
--------
* Converts QUICK .in files into .xyz files
* Example: `xyz-maker.sh /path/to/folder/with/QUICK/input/files /path/to/folder/for/xyz/files`
* The script will create `/path/to/folder/for/xyz/files`, the directory does not need to be created beforehand
* The input files don't need to be in any particular format beforehand