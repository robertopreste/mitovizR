#' Plot variants from a JSON file
#'
#' Adds a geom_point layer to the output of \code{\link{mito_plot}} showing
#' mitochondrial variants contained in the given JSON file
#'
#' @param json_file Path of the input JSON file
#' @param json_format JSON format used; allowed values are c("vector", "dataframe") (default = "vector")
#' @param var_col When json_format = "dataframe", name of column containing variants position (default = "POS")
#' @param show_loci_names Show labels of loci names on the genome (default = TRUE)
#' @param show_loci_legend Show legend for locus type colours (default = TRUE)
#' @param show_var_labels Show labels with the position for each variant (default = FALSE)
#' @param title Set plot title (default = "")
#' @param save_plot Save the current plot to a file (default = FALSE)
#' @param save_to Path or filename to which the current plot will be saved (default = "mitoviz_plot.png")
#'
#' @return p ggplot2 polar plot variants on the human mitochondrial genome
#'
#' @import jsonlite
#' @import ggplot2
#'
#' @export

plot_json <- function(json_file, json_format = "vector", var_col = "POS",
                      show_loci_names = TRUE, show_loci_legend = TRUE,
                      show_var_labels = FALSE,
                      title = "", save_plot = FALSE, save_to = "mitoviz_plot.png") {
    if (json_format == "vector") {
        dataframe = data.frame(CHROM = "chrMT", POS = fromJSON(json_file),
                               stringsAsFactors = F)
        p <- plot_df(dataframe,
                     show_loci_names = show_loci_names,
                     show_loci_legend = show_loci_legend,
                     show_var_labels = show_var_labels,
                     title = title,
                     save_plot = save_plot, save_to = save_to)
    } else if (json_format == "dataframe") {
        dataframe = fromJSON(json_file)
        p <- plot_df(dataframe, var_col = var_col,
                     show_loci_names = show_loci_names,
                     show_loci_legend = show_loci_legend,
                     show_var_labels = show_var_labels,
                     title = title,
                     save_plot = save_plot, save_to = save_to)
    } else {
        stop("Unrecognized json_format argument.")
    }

    return(p)
}
