% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_vcf.R
\name{plot_vcf}
\alias{plot_vcf}
\title{Plot variants from a VCF}
\usage{
plot_vcf(vcf_file, show_loci_names = TRUE, show_loci_legend = TRUE,
  show_var_labels = FALSE, title = "", save_plot = FALSE,
  save_to = "mitoviz_plot.png", verbose = FALSE)
}
\arguments{
\item{vcf_file}{Path of the input VCF file}

\item{show_loci_names}{Show labels of loci names on the genome (default = TRUE)}

\item{show_loci_legend}{Show legend for locus type colours (default = TRUE)}

\item{show_var_labels}{Show labels with the position for each variant (default = FALSE)}

\item{title}{Set plot title (default = "")}

\item{save_plot}{Save the current plot to a file (default = FALSE)}

\item{save_to}{Path or filename to which the current plot will be saved (default = "mitoviz_plot.png")}

\item{verbose}{Show messages returned by the \code{vcfR} package functions (default = FALSE)}
}
\value{
p ggplot2 polar plot variants on the human mitochondrial genome
}
\description{
Adds a geom_point layer to the output of \code{\link{mito_plot}} showing
mitochondrial variants contained in the given VCF file.
}
