
mitovizR
========

[![Build Status](https://travis-ci.com/robertopreste/mitovizR.svg?branch=master)](https://travis-ci.com/robertopreste/mitovizR) [![codecov](https://codecov.io/gh/robertopreste/mitovizR/branch/master/graph/badge.svg)](https://codecov.io/gh/robertopreste/mitovizR)

Plot variants on the human mitochondrial genome. Currently supports plotting variants contained in dataframes, VCF or JSON files.

Overview
--------

mitovizR is a simple R package to plot human mitochondrial variants on a graphical representation of the human mitochondrial genome. It currently supports plotting variants stored in a dataframe or a VCF or JSON file, although other options are being developed (if you want to contribute, you're welcome!).

Installation
------------

mitovizR can be installed in R from GitHub using `devtools`:

``` r
devtools::install_github("robertopreste/mitovizR")
```

Official installation from CRAN/Bioconductor coming soon!

Usage
-----

First of all, load the `mitovizR` package:

``` r
library(mitovizR)
```

### Plot variants from a dataframe

The simplest example is when you already have a dataframe with a set of mitochondrial variants.

``` r
minidf 
```

| CHROM |    POS| ID  | REF | ALT | QUAL | FILTER |
|:------|------:|:----|:----|:----|:-----|:-------|
| chrMT |    709| NA  | G   | A   | NA   | PASS   |
| chrMT |    750| NA  | A   | G   | NA   | PASS   |
| chrMT |   1438| NA  | A   | G   | NA   | PASS   |
| chrMT |   3106| NA  | CN  | C   | NA   | PASS   |
| chrMT |   4769| NA  | A   | G   | NA   | PASS   |
| chrMT |   7028| NA  | C   | T   | NA   | PASS   |
| chrMT |   9389| NA  | A   | G   | NA   | PASS   |
| chrMT |  11719| NA  | G   | A   | NA   | PASS   |
| chrMT |  14905| NA  | G   | A   | NA   | PASS   |
| chrMT |  15452| NA  | C   | A   | NA   | PASS   |

In this case, a call to `plot_df()` will plot all mitochondrial variants; by default, this function will look for a `POS` column containing variants position, but custom column names can be specified using the `pos_col` option.

``` r
plot_df(minidf)
# specify the variant positions column name
plot_df(minidf, pos_col = "position")
```

![](man/figures/mitoviz_plot_df.png)

It is possible to show a label on each variant with its position, reference and alternate allele, using the `show_var_labels` option. In this case, by default the `plot_df()` function will look for columns named `POS`, `REF` and `ALT`, containing respectively variant positions, reference alleles and alternate alleles; you can specify different column names using respectively the `pos_col`, `ref_col` and `alt_col` options.

``` r
plot_df(minidf, show_var_labels = TRUE)
# specify the variant positions, reference and alternate alleles column names
plot_df(minidf, show_var_labels = TRUE, 
        pos_col = "POS", ref_col = "REF", alt_col = "ALT")
```

![](man/figures/mitoviz_plot_df_labels.png)

### Plot variants from a VCF file

The `plot_vcf()` function allows to plot human mitochondrial variants contained in a VCF file. In this example, a VCF file named "HG00119.vcf" and present in the current working directory is used:

``` r
plot_vcf("HG00119.vcf")
```

It is also possible to specify whether the plot will show loci names and/or loci legend:

``` r
# do not show loci names
plot_vcf("HG00119.vcf", show_loci_names = FALSE)
```

![](man/figures/mitoviz_plot_no_loci_names.png)

``` r
# do not show loci legend 
plot_vcf("HG00119.vcf", show_loci_legend = FALSE)
```

![](man/figures/mitoviz_plot_no_loci_legend.png)

A specific title can be added to the plot using the `title` option:

``` r
plot_vcf("HG00119.vcf", title = "My mito plot")
```

![](man/figures/mitoviz_plot_title.png)

By default, the plot will be returned and shown; if you want to save the plot to a file, just use the `save_plot` option:

``` r
plot_vcf("HG00119.vcf", save_plot = TRUE)
```

This will create a file named `mitoviz_plot.png` in the current working directory.

It is also possible to save the plot to a specific path and/or with a custom filename, using the `save_to` option:

``` r
plot_vcf("HG00119.vcf", save_plot = TRUE, save_to = "my_folder/my_plot_name.png")
```

### Plot variants from a JSON file

Some tools will output mitochondrial variants in a JSON-formatted file; in this case, the `plot_json()` function is what you need. JSON files can usually be in two different formats:

-   vector format, where variant positions are simply stored in a vector
-   dataframe format, where each variant is stored in its own entry

The `plot_json()` function can handle both cases, using a different argument for its `json_format` option.

#### Vector-formatted JSON files

An example of a vector-formatted JSON file is the following:

``` r
# content of json_vector.json
["420", "1000", "3000", "5000", "10000"]
```

Using `json_format = "vector"` allows to plot variants from this file.

``` r
plot_json("json_vector.json", json_format = "vector")
```

![](man/figures/mitoviz_plot_json_vector.png)

#### Dataframe-formatted JSON files

An example of a dataframe-formatted JSON file is the following:

``` r
# content of json_dataframe.json
[
  {"feat1": "snp", "position": 420},
  {"feat1": "snp", "position": 1000},
  {"feat1": "snp", "position": 3000},
  {"feat1": "snp", "position": 5000},
  {"feat1": "snp", "position": 10000}
]
```

In this case, just set `json_format = "dataframe"`. By default, the `plot_json()` function will look for a `POS` column with variant positions, but you can specify a different column name using the `pos_col` option.

``` r
plot_json("json_dataframe.json", json_format = "dataframe", pos_col = "position")
```

![](man/figures/mitoviz_plot_json_dataframe.png)

Help
----

If you found a bug, or want to suggest an improvement, please feel free to open an [issue](https://github.com/robertopreste/mitovizR/issues).

Todo
----

-   Plot variants from [HmtDB](https://www.hmtdb.uniba.it) JSON
-   Plot variants from BED files
