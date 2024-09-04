# MCMCtree 4.9j-forked

MCMCtree is a Bayesian MCMC program for estimation of species divergence times using molecular and trait data. MCMCtree was written by Ziheng Yang from University College London. This is a fork of MCMCtree version 4.9j with small modifications suitable for large-scale analyses. The latest version can be found in [PAML's repository](https://github.com/abacus-gene/paml).

## Citation

If you use this version of MCMCtree in your publications, please indicate so as MCMCtree version 4.9j-forked (available at https://github.com/dosreislab/mcmctree). General citations for MCMCtree are:

* Yang, Z., and B. Rannala. 2006. **Bayesian estimation of species divergence times under a molecular clock using multiple fossil calibrations with soft bounds**. _Molecular Biology and Evolution_, 23: 212–226.
* Rannala B, Yang Z. 2007. **Inferring speciation times under an episodic molecular clock**. _Systematic Biology_, 56: 453-466. 

The first paper describes the MCMC algorith and the birth-death prior conditioned on soft fossil calibrations. The second paper describes the relaxed clock implementation. If you use the approximate likelihood method please cite:

* dos Reis M, Yang Z. 2011. **Approximate likelihood calculation for Bayesian estimation of divergence times**. _Molecular Biology and Evolution_, 28:2161-2172.


## Control file

This sectiond describes settings in the control file for this version of MCMCtree which may behave slightly different than the main production version. Please do not assume compatibility.

```
seed = -1
seqfile = ape4s.phy
treefile = ape4s.tree
outfile = out
checkpoint = 1

ndata = 1      * number of partitions
usedata = 1    * 0: no data; 1:exact likelihood; 2:approximate likelihood; 3: prepare approx. lkhd files
clock = 1      * 1: global clock; 2: independent rates; 3: correlated rates

model = 4    * 0:JC69, 1:K80, 2:F81, 3:F84, 4:HKY85
alpha = .5   * alpha for gamma rates at sites
ncatG = 5    * No. categories in discrete gamma

cleandata = 0    * remove sites with ambiguity data (1:yes, 0:no)?

BDparas = 1 1 0      * birth, death, sampling
kappa_gamma = 2 .2   * gamma prior for kappa
alpha_gamma = 2 4    * gamma prior for alpha

rgene_gamma = 2 2   * gamma prior for mean rates for genes
sigma2_gamma = 1 10  * gamma prior for sigma^2 (for clock=2 or 3)

print = 1
burnin = 4000
sampfreq = 6
nsample = 5000
```

**checkpoint** activates checkpointing. If `checkpoint = 1` the state of the MCMC chain will be saved to file `mcmctree.ckpt` every 10% percentile of the total MCMC run length. Burn-in is used as set in the control file and states during burn-in are not saved. If `checkpoint = 2`, the program will resume the MCMC chain from the `mcmctree.ckpt` file. In this case the `burnin` variable is ignored (i.e., is set to zero internally). The state of the chain is also saved every 10% percentile. This version of MCMCtree allows unlimited checkpoint runs, simply rename the `mcmc.txt` file once the run has finished and restart the MCMC chain. The varios MCMC files can then be merged into a larger file and process with `print = -1` in the control file. In short, use `checkpoint = 1` for the first run in which you need to use burn-in, then use `checkpoint = 2` for subsequent runs.