<!-- README.md is generated from README.Rmd. Please edit that file -->

# sims2

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![R-CMD-check](https://github.com/poissonconsulting/sims2/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/poissonconsulting/sims2/actions/workflows/R-CMD-check.yaml)
[![Codecov](https://codecov.io/gh/poissonconsulting/sims2/graph/badge.svg)](https://app.codecov.io/gh/poissonconsulting/sims2)
[![License:
MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/license/mit/)
[![CRAN
status](https://www.r-pkg.org/badges/version/sims2)](https://cran.r-project.org/package=sims2)
![CRAN downloads](http://cranlogs.r-pkg.org/badges/sims2)
<!-- badges: end -->

sims2 is an R package to generate datasets from R or
[JAGS](https://mcmc-jags.sourceforge.io/) code for use in simulation
studies. The datasets are returned as an
[nlists](https://github.com/poissonconsulting/nlist) object and/or saved
to file as individual .rds files. Parallelization is implemented using
the [future](https://github.com/HenrikBengtsson/future) package.
Progress is reported using the
[progressr](https://github.com/HenrikBengtsson/progressr) package.

## Installation

You can install sims2 from
[GitHub](https://github.com/poissonconsulting/sims2) with:

    # install.packages("remotes")
    remotes::install_github("poissonconsulting/sims2")

## Demonstration

### Simulate Data

By default, `sims_simulate()` returns the simulated datasets in the form
of an [nlists](https://github.com/poissonconsulting/nlist) object.

    library(sims2)
    set.seed(10)
    sims_simulate("a <- runif(1)", nsims = 2L)
    #> $a
    #> [1] 0.2213763
    #> 
    #> an nlists object of 2 nlist objects each with 1 numeric element

If, however, `save = TRUE` then each nlist object is saved as an `.rds`
file in `path`.

    set.seed(10)
    sims_simulate("a <- runif(1)", nsims = 2L, save = TRUE, path = tempdir(), exists = NA)
    #> [1] TRUE
    sims_data_files(tempdir())
    #> [1] "data0000001.rds" "data0000002.rds"
    sims_data(tempdir())
    #> $a
    #> [1] 0.2213763
    #> 
    #> an nlists object of 2 nlist objects each with 1 numeric element

## Information

For more information see the [Get
Started](https://poissonconsulting.github.io/sims2/articles/sims2.html)
vignette.

## Contribution

Please report any
[issues](https://github.com/poissonconsulting/sims2/issues).

[Pull requests](https://github.com/poissonconsulting/sims2/pulls) are
always welcome.

## Code of Conduct

Please note that the sims2 project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
