benchmarks="psb5 morphine taxol valinomycin"
tasks="1 2 4"
exe=quick.cuda.MPI

host=$(hostname -s)
echo ">>> Running on host $host <<<"

for bench in $benchmarks
do
    echo
    echo "Benchmark $bench"
    for nt in $tasks
    do
	tstart=$(date '+%s')
	mpirun -np $nt $exe $bench.in
	tstop=$(date '+%s')
	printf "%d" $nt
	echo "$tstart $tstop" | awk '{elapsed=$2-$1; printf " >> Elapsed time = %d seconds = %8.1f minutes\n", elapsed, elapsed/60}'
	mv $bench.out ${bench}-$nt.out
    done
done
