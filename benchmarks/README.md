# QUICK benchmarks

Selection of benchmarks for QUICK.
Some of these benchmarks have been used in following publications:

Manathunga, M.; Miao, Y.; Mu, D.; Götz, A. W.; Merz, K. M.
Parallel Implementation of Density Functional Theory Methods in the Quantum Interaction Computational Kernel Program.
[*J. Chem. Theory Comput.* 16, 4315-4326 (2020)](https://pubs.acs.org/doi/10.1021/acs.jctc.0c00290).

Manathunga, M.; Jin, C; Cruzeiro, V. W. D.; Miao, Y.; Mu, D.; Arumugam, K.; Keipert, K.; Aktulga, H. M.; Merz, K. M.; Götz, A. W.
Harnessing the Power of Multi-GPU Acceleration into the Quantum Interaction Computational Kernel Program.
[*J. Chem. Theory Comput.* 17, 3955–3966 (2021)](https://pubs.acs.org/doi/abs/10.1021/acs.jctc.1c00145).


## Benchmark settings

The input files use following settings:
- Method B3LYP/6-31G**
- SCF + gradient calculation
- QUICK default integral cutoff (for SCF and gradient integrals) and SCF convergence
  (cutoff=1.0e-7 denserms=1.0e-6)
  
The publications cited above have used different settings and combinations of methods and basis sets.
For instance, in the past we used to be overly rigorous with integral cutoffs and SCF convergence settings.
For details, please check the publications.

Computational expense can be
- reduced by switching off DFT (running a Hartree-Fock calculation)
or by using a smaller basis set like 6-31G* or 3-21G.
- increased by using larger basis sets like def2-SVP, cc-pVDZ, def2-TZVP, cc-pVTZ, or others.
If you change settings, make sure to document everything properly in your benchmark data.


## Recommendations

Some of the benchmarks are rather large (crambin) or have difficult SCF convergence (1m2c).
We have most often used psb5, morphine, taxol, and valinomycin.
Start with these, and explore other benchmarks later.

