<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

# rnorsk <img src="man/figures/logo.png" align="right" alt="" width="120" />

[Homepage](https://ihrke.github.io/rnorsk/)

This packages is the companion package to our book "Innføring i R for statistiske dataanalyser".

Mehmetoglu, M. & Mittner, M. (2020). Innføring i R for statistiske dataanalyser. Universitetsforlaget. https://www.universitetsforlaget.no/innforing-i-r-for-statistiske-dataanalyser

All datasets and code-examples used in the book are included in this package. In addition, the package
contains several convenience functions that are used in the book.

## Installation

You can install the package from github using

``` r
#install.packages("devtools")
devtools::install_github("ihrke/rnorsk")
```

## Usage

In order to run the example codes from the book, you can use the following to install all 
packages used in the book.

``` r
library(rnorsk)
install.packages(rnorsk.all.used.packages)
```

## Code-examples

All code-examples presented in the book are included in this package. 

- **Kapittel 0**: [`kapittel_00-forord.R`](https://github.com/ihrke/rnorsk/inst/code-examples/kapittel_00-forord.R)
- **Kapittel 1**: [`kapittel_01-intro.R`](https://github.com/ihrke/rnorsk/inst/code-examples/kapittel_01-intro.R)
- **Kapittel 2**: [`kapittel_02-import-data.R`](https://github.com/ihrke/rnorsk/inst/code-examples/kapittel_02-import-data.R)
- **Kapittel 3**: [`kapittel_03-hvordan-fungerer.R`](https://github.com/ihrke/rnorsk/inst/code-examples/kapittel_03-hvordan-fungerer.R)
- **Kapittel 4**: [`kapittel_04-databehandling.R`](https://github.com/ihrke/rnorsk/inst/code-examples/kapittel_04-databehandling.R)
- **Kapittel 5**: [`kapittel_05-visualisering.R`](https://github.com/ihrke/rnorsk/inst/code-examples/kapittel_05-visualisering.R)
- **Kapittel 6**: [`kapittel_06-deskriptiv_statistikk.R`](https://github.com/ihrke/rnorsk/inst/code-examples/kapittel_06-deskriptiv_statistikk.R)
- **Kapittel 7**: [`kapittel_07-lineær_regresjon.R`](https://github.com/ihrke/rnorsk/inst/code-examples/kapittel_07-lineær_regresjon.R)
- **Kapittel 8**: [`kapittel_08-dummy_regresjon.R`](https://github.com/ihrke/rnorsk/inst/code-examples/kapittel_08-dummy_regresjon.R)
- **Kapittel 9**: [`kapittel_09-interaksjon_regresjon.R`](https://github.com/ihrke/rnorsk/inst/code-examples/kapittel_09-interaksjon_regresjon.R)
- **Kapittel 10**: [`kapittel_10-logistisk-regresjon.R`](https://github.com/ihrke/rnorsk/inst/code-examples/kapittel_10-logistisk-regresjon.R)
- **Kapittel 11**: [`kapittel_11-faktoranalyse.R`](https://github.com/ihrke/rnorsk/inst/code-examples/kapittel_11-faktoranalyse.R)
- **Kapittel 12**: [`kapittel_12-bayesiansk.R`](https://github.com/ihrke/rnorsk/inst/code-examples/kapittel_12-bayesiansk.R)
