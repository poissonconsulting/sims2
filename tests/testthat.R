library(testthat)
library(sims2)

if (nzchar(Sys.getenv("CI"))) {
  future::plan("sequential")
}

test_check("sims2")
