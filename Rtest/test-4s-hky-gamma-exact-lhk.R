# Test 4 ape species using HKY+gamma, strict clock and exact likelihood.
# rm(list=ls())
if (!exists("mcmctree")) mcmctree <- "mcmctree"
test_name <-  "4s-hky-gamma-exact-lhk"
cat("Testing:", test_name, "\n")
test_dir <- getwd() # This should be Rtest

# benchmark file holding results for comparison:
benchmark <- paste("test-", test_name, ".rda", sep="")
# load benchmark data for testing:
load(benchmark)

# Set up tmp directory for testing:
# (note R will delete temprary dictory once the R process is finished)
tmp_dir <- paste(tempdir(), "/", test_name, sep="")
dir.create(tmp_dir)

# copy data files:
file.copy("../data/ape4s/ape4s.tree", tmp_dir)
file.copy("../data/ape4s/ape4s.phy", tmp_dir)
file.copy("../data/ape4s/mcmctree.ctl", tmp_dir)

# go into tmp directory and run mcmctree:
setwd(tmp_dir)
system(mcmctree)
mcmc <- read.table("mcmc.txt", head=TRUE)
mcmc.means <- apply(mcmc[,-1], 2, mean)
seed <- scan("SeedUsed")

# This block creates the benchmark file for testing. The benchmark file should
# be created once, using a stable version of MCMCtree, committed with git, and
# used for future comparisons. The benchmark file must not be recreated during
# testing.
if (FALSE) {
  benchmk <- mcmc.means
  save(benchmk, file=benchmark)
}

# calculate relative absolute error between benchmark and test results:
rel.err <- abs( benchmk - mcmc.means ) / mcmc.means

# Tolerance threshold to trigger error:
thr0 <- 0.01
thr1 <- 0.05

# Print executable and seed used to screen so any errors can be reproduced:
cat("Test: MCMCtree executable was ", mcmctree, "\n")
cat("Test:", test_name, "seed used was", seed, "\n")

# The moment of truth:
if (any(rel.err > thr0)) {
  cat("Test:", test_name, "failed with threshold 0!\n")
} else if (any(rel.err > thr1)){
  cat("Test:", test_name, "failed with threshold 1!\n")
} else {
  cat("Test:", test_name, "successful!\n")
}

# go back to master testing directory:
setwd(test_dir)
