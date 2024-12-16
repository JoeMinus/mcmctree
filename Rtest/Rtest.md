# Testing MCMCtree using R

Each test must be implemented in an indivual R script. Each script is expected to call MCMCtree on some data, read the results in, and then compare the restuls to a benchmark. If the comparison is unsastisfactory the test fails.

The `testall.R` script is used to call all tests.

Use informative names for test scripts, for example `test-4s-hky-gamma-exact-lk.R`.

Benchmark data (e.g., the processed output from a reference MCMC run) should be stored in text files (e.g. `*.txt`, `*.csv`) or R data files (e.g., `*.rda`). The benchmark file should use the same name as the calling script (e.g, `test-4s-hky-gamma-exact-lk.rda`).

Original input data for running MCMCtree and appropriate control files must be stored in the `data/` directory.
