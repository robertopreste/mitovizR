#' Plot variants from a JSON file
#'
#' Adds a geom_point layer to the output of \code{\link{mito_plot}} showing
#' mitochondrial variants contained in the given JSON file
#'
#' @param json_file Path of the input JSON file
#' @param show_loci_names Show labels of loci names on the genome (default = TRUE)
#' @param show_loci_legend Show legend for locus type colours (default = TRUE)
#' @param title Set plot title (default = "")
#' @param save_plot Save the current plot to a file (default = FALSE)
#' @param save_to Path or filename to which the current plot will be saved (default = "mitoviz_plot.png")
#'
#' @return p ggplot2 polar plot variants on the human mitochondrial genome
#'
#' @import ggplot2
#'
#' @export


