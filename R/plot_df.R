#' Plot variants from a dataframe
#'
#' Adds a geom_point layer to the output of \code{\link{mito_plot}} showing
#' mitochondrial variants contained in the given dataframe.
#'
#' @param dataframe Name of the input dataframe
#' @param var_col Name of column containing variants position (default = "POS")
#' @param show_loci_names Show labels of loci names on the genome (default = TRUE)
#' @param show_loci_legend Show legend for locus type colours (default = TRUE)
#' @param show_var_labels Show labels with the position for each variant (default = FALSE)
#' @param title Set plot title (default = "")
#' @param save_plot Save the current plot to a file (default = FALSE)
#' @param save_to Path or filename to which the current plot will be saved (default = "mitoviz_plot.png")
#'
#' @return p ggplot2 polar plot variants on the human mitochondrial genome
#'
#' @import ggplot2
#' @import ggrepel
#'
#' @export

plot_df <- function(dataframe, var_col = "POS",
                    show_loci_names = TRUE, show_loci_legend = TRUE,
                    show_var_labels = FALSE, title = "",
                    save_plot = FALSE, save_to = "mitoviz_plot.png") {
    var_col_idx <- which(colnames(dataframe) == var_col)
    dataframe[, var_col_idx] <- as.numeric(dataframe[, var_col_idx])
    p <- mito_plot(show_loci_names = show_loci_names,
                   show_loci_legend = show_loci_legend) +
        geom_point(data = dataframe,
                   mapping = aes_string(x = 3, y = var_col)) +
        labs(title = title)
    if (show_var_labels == TRUE) {
        p <- p +
            geom_label_repel(data = dataframe,
                             mapping = aes_string(x = 3, y = var_col,
                                                  label = var_col))
    }
    if (save_plot == TRUE) {
        ggsave(filename = save_to, plot = p,
               height = 10.7, width = 9.46, units = "in")
    }

    return(p)
}
