seed = -1
seqfile = ape4s.phy
treefile = ape4s.tree
outfile = out

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
nsample = 100000
