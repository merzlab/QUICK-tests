Usage Guide:

BENCHMARKING 

Copy bench.sh and bm_ind.slurm to the quick install directory
Run ./bench.sh (might have to chmod +x bench.sh) and pass in the input file directory (defaults to benchmarkinputs) as the first parameter.

Example: 

./bench.sh test_these_files

In this case, test_these_files is a folder containing a bunch of .in files.

CONVERTING .in TO .xyz 

Use in_to_xyz.sh with the input and output directories specified as parameters.

Example:

./in_to_xyz.sh my_input_files xyz_output_files

In this case, my_input_files is a folder containing a bunch of .in files and xyz_output_files is a folder containing corresponding .xyz files. 

GETTING ATOM NUMBERS 

Use get_atom_number.sh with the input directory and output file name specified as parameters.

Example: 

./get_atom_number count_these_ones countingresults.txt

In this case, count_these_ones is a folder containing a bunch of .in files and countingresults.txt is a file which lists all the .in files along with a number representing the number of atoms found in that .in file. 