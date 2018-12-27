#' Plot variants from a dataframe
#'
#' Adds a geom_point layer to the output of \code{\link{mito_plot}} showing
#' mitochondrial variants contained in the given dataframe.
#'
#' @param dataframe Name of the input dataframe; will need a `POS` column with variants position
#' @param show_loci_names Show labels of loci names on the genome (default = TRUE)
#' @param show_loci_legend Show legend for locus type colours (default = TRUE)
#' @param title Set plot title (default = "")
#' @param save_plot Save the current plot to a file (default = FALSE)
#' @param save_to Path or filename to which the current plot will be saved (default = "mitoviz_plot.png")
#' @param verbose Show messages returned by the \code{vcfR} package functions (default = FALSE)
#'
#' @return p ggplot2 polar plot variants on the human mitochondrial genome
#'
#' @import ggplot2
#'
#' @export

plot_df <- function(dataframe, show_loci_names = TRUE, show_loci_legend = TRUE,
                    title = "", save_plot = FALSE, save_to = "mitoviz_plot.png",
                    verbose = FALSE) {
    vars <- as.numeric(dataframe$POS)
    p <- mito_plot(show_loci_names = show_loci_names,
                   show_loci_legend = show_loci_legend) +
        geom_point(data = vars,
                   mapping = aes_string(x = 3, y = "POS")) +
        labs(title = title)
    if (save_plot == TRUE) {
        ggsave(filename = save_to, plot = p,
               height = 10.7, width = 9.46, units = "in")
    }

    return(p)
}
