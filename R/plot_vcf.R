#' Plot variants from a VCF
#'
#' Adds a geom_point layer to the output of \code{\link{mito_plot}} showing
#' mitochondrial variants contained in the given VCF file.
#'
#' @param vcf_file Path of the input VCF file
#' @param show_loci_names Show labels of loci names on the genome (default = TRUE)
#' @param show_loci_legend Show legend for locus type colours (default = TRUE)
#' @param save_plot Save the current plot to a file named "mitoviz_plot.png" (default = FALSE)
#' @param verbose Show messages returned by the \code{vcfR} package functions
#'
#' @return p ggplot2 polar plot variants on the human mitochondrial genome
#'
#' @import vcfR
#' @import ggplot2
#'
#' @export

plot_vcf <- function(vcf_file, show_loci_names = TRUE, show_loci_legend = TRUE,
                     save_plot = FALSE, verbose = FALSE) {
    vcf <- read.vcfR(vcf_file, verbose = verbose)
    chrom <- create.chromR(vcf, verbose = verbose)
    vars <- as.data.frame(getFIX(chrom), stringsAsFactors = F)
    vars$POS <- as.numeric(vars$POS)
    p <- mito_plot(show_loci_names = show_loci_names,
                   show_loci_legend = show_loci_legend) +
        geom_point(data = vars,
                   mapping = aes_string(x = 3, y = "POS"))
    if (save_plot == TRUE) {
        ggsave(filename = "mitoviz_plot.png", plot = p,
               height = 10.7, width = 9.46, units = "in")
    }

    return(p)
}
