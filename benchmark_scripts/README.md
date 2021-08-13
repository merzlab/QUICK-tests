Usage Guide:

BENCHMARKING 

Copy proto.sh and bm_handler.slurm to the quick install directory
Run ./proto.sh (might have to chmod +x bench.sh) and pass in the input file directory (defaults to benchmarkinputs) as the first parameter.

Example: 

./proto.sh test_these_files

In this case, test_these_files is a folder containing a bunch of .in files. Standard files for benchmarking are present in the chosen_inputs folder. 
