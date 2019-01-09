#' Plot variants from a VCF
#'
#' Adds a geom_point layer to the output of \code{\link{mito_plot}} showing
#' mitochondrial variants contained in the given VCF file.
#'
#' @param vcf_file Path of the input VCF file
#' @param show_loci_names Show labels of loci names on the genome (default = TRUE)
#' @param show_loci_legend Show legend for locus type colours (default = TRUE)
#' @param show_var_labels Show labels with the position for each variant (default = FALSE)
#' @param title Set plot title (default = "")
#' @param save_plot Save the current plot to a file (default = FALSE)
#' @param save_to Path or filename to which the current plot will be saved (default = "mitoviz_plot.png")
#' @param verbose Show messages returned by the \code{vcfR} package functions (default = FALSE)
#'
#' @return p ggplot2 polar plot variants on the human mitochondrial genome
#'
#' @import vcfR
#' @import ggplot2
#'
#' @export

plot_vcf <- function(vcf_file, show_loci_names = TRUE, show_loci_legend = TRUE,
                     show_var_labels = FALSE,
                     title = "", save_plot = FALSE, save_to = "mitoviz_plot.png",
                     verbose = FALSE) {
    vcf <- read.vcfR(vcf_file, verbose = verbose)
    chrom <- create.chromR(vcf, verbose = verbose)
    dataframe <- as.data.frame(getFIX(chrom), stringsAsFactors = F)
    p <- plot_df(dataframe, show_loci_names = show_loci_names,
                 show_loci_legend = show_loci_legend,
                 show_var_labels = show_var_labels, title = title,
                 save_plot = save_plot, save_to = save_to)

    return(p)
}
