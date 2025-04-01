# Run all tests
# All test scripts must be named test-*.R

if (!exists("mcmctree")) mcmctree <- "mcmctree"
test_dir <- getwd() # This must be Rtest/
test_files <- dir(".", pattern=glob2rx("test-*.R"))

for (f in test_files) {
  # make sure we are at master testing directory before running any tests
  setwd(test_dir)
  # run tests
  source(f)
}

# TODO: collect errors, identified failed tests
