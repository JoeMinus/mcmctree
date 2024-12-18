# Testing MCMCtree using R

Each test must be implemented in an individual R script. Each script is expected
to call MCMCtree on some data, read the results in, and then compare the results
to a benchmark. If the comparison is unsatisfactory the test fails.

The tests in this directory are meant to be statistical, that is, tests should
check whether results are accurate to a tolerance error. This testing approach
allows testing different versions of the program in which, for example,
configuration of the MCMC proposals may have changed, but not the models. This
should also result in tests that are platform independent.

The `testall.R` script is used to call all tests.

Use informative names for test scripts, for example
`test-4s-hky-gamma-exact-lhk.R`.

Benchmark data (e.g., the processed output from a reference MCMC run) should be
stored in text files (e.g. `*.txt`, `*.csv`) or R data files (e.g., `*.rda`).
The benchmark file should use the same name as the calling script (e.g,
`test-4s-hky-gamma-exact-lhk.rda`).

Original input data for running MCMCtree and appropriate control files must be
stored in the `data/` directory.
