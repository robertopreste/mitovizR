README
================
Roberto Preste
2018-12-24

mitovizR
========

Plot variants on the human mitochondrial genome. Currently supports plotting variants contained in VCF files.

Overview
--------

mitovizR is a simple tool to plot human mitochondrial variants on a graphical representation of the human mitochondrial genome. It currently supports plotting variants stored in a VCF file, although other options are being developed (if you want to contribute, you're welcome!).

Installation
------------

mitovizR can be installed from GitHub using `devtools`:

``` r
devtools::install_github("robertopreste/mitovizR")
```

Official installation from CRAN coming soon!

Usage
-----

In order to plot human mitochondrial variants contained in a VCF file named "HG00119.vcf" and present in the current working directory:

``` r
mitovizR::plot_vcf("HG00119.vcf")
```

Help
----

If you found a bug, or want to suggest an improvement, please feel free to open an [issue](https://github.com/robertopreste/mitovizR/issues).
