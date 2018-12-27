#' Plot mitochondrial genome
#'
#' Creates the basic graphic representation of the human mitochondrial
#' genome, that will be used to plot variants through \code{\link{plot_vcf}}.
#'
#' @param show_loci_names Show labels of loci names on the genome (default = TRUE)
#' @param show_loci_legend Show legend for locus type colours (default = TRUE)
#'
#' @return p ggplot2 polar plot showing the human mitochondrial genome
#'
#' @import ggplot2

mito_plot <- function(show_loci_names = TRUE, show_loci_legend = TRUE) {
    loci <- mito_df()
    p <- ggplot(loci) +
        geom_rect(aes_string(fill = "type", ymax = "ymax", ymin = "ymin",
                             xmax = 4, xmin = 3)) +
        coord_polar(theta = "y", direction = -1) +
        xlim(c(0, 4)) +
        theme_void() +
        #         theme_minimal() +
        theme(axis.text.y = element_blank(),
              legend.position = "bottom", legend.title = element_blank()) +
        xlab("") + ylab("") +
        scale_fill_manual(values = c("aquamarine4", "coral", "brown3", "cornflowerblue"),
                          labels = c(" Coding ", " Regulatory ", " rRNA ", " tRNA "))
    if (show_loci_names == TRUE) {
        p <- p +
            geom_text(aes_string(x = 4, y = "ymax", label = "locus",
                                 hjust = "hjust", vjust = "vjust", angle = "angle"),
                      size = 3)
    }
    if (show_loci_legend == FALSE) {
        p <- p +
            guides(fill = FALSE)
    }

    return(p)
}
