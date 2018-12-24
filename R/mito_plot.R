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
    locus <- c("DLOOP", "TF", "RNR1", "TV", "RNR2", "TL1",
               "ND1", "TI", "TQ", "TM", "ND2", "TW", "TA", "TN",
               "TC", "TY", "CO1", "TS1", "TD", "CO2", "TK", "ATP8",
               "ATP6", "CO3", "TG", "ND3", "TR", "ND4L", "ND4", "TH",
               "TS2", "TL2", "ND5", "ND6", "TE", "CYTB", "TT", "TP",
               "")

    lengths <- c(576, 71, 954, 69, 1559, 75,
                 956, 69, 72, 68, 1042, 68, 69, 73,
                 66, 66, 1542, 72, 68, 684, 70, 207,
                 681, 784, 68, 346, 65, 297, 1378, 69,
                 59, 71, 1812, 525, 69, 1141, 66, 69,
                 546)

    type <- c("reg", "trna", "rrna", "trna", "rrna", "trna",
              "cds", "trna", "trna", "trna", "cds", "trna", "trna", "trna",
              "trna", "trna", "cds", "trna", "trna", "cds", "trna", "cds",
              "cds", "cds", "trna", "cds", "trna", "cds", "cds", "trna",
              "trna", "trna", "cds", "cds", "trna", "cds", "trna", "trna",
              "reg")

    ymax <- c(576, 647, 1601, 1670, 3229, 3304,
              4262, 4331, 4400, 4469, 5511, 5579, 5655, 5729,
              5826, 5891, 7445, 7514, 7585, 8269, 8364, 8572,
              9207, 9990, 10058, 10404, 10469, 10766, 12137, 12206,
              12265, 12336, 14148, 14673, 14742, 15887, 15953, 16023,
              16569)

    ymin <- c(0, 576, 647, 1601, 1670, 3229,
              3304, 4262, 4331, 4400, 4469, 5511, 5579, 5655,
              5729, 5826, 5891, 7445, 7514, 7585, 8269, 8364,
              8572, 9207, 9990, 10058, 10404, 10469, 10766, 12137,
              12206, 12265, 12336, 14148, 14673, 14742, 15887, 15953,
              16023)

    hjust <- c(1.2, 1.2, 1.2, 1.2, 1.8, 1.2,
               1.8, 1.6, 1.2, 1.4, 1.7, 1.2, 1.6, 1.2,
               1.6, 1.2, 1.6, 1.2, 1.2, -0.2, -0.2, -0.1,
               -0.2, -0.3, -0.2, -0.2, -0.2, -0.2, -0.6, -0.2,
               -0.2, -0.2, -0.7, -0.4, -0.2, -0.5, -0.2, -0.2,
               -0.2)

    vjust <- c(-5.880, 0.355, -4.770, 0.345, -7.795, 0.375,
               -4.790, 0.145, 0.345, 0.545, -5.210, 0.040, 0.180, 0.270,
               0.255, 0.325, -7.770, 0.145, 0.455, 4.020, 1.075, 1.740,
               3.875, 4.515, 0.940, 2.330, 0.925, 2.285, 7.955, 1.245,
               0.895, 0.655, 9.660, 3.225, 0.945, 6.325, 1.130, 0.650,
               2.730)

    angle <- c(-88.38, -76.15, -66.92, -57.69, -44.46, -28.23,
               -20.00, -12.77, -2.54, 12.31, 12.92, 16.15, 25.38, 34.61,
               33.85, 53.08, 55.31, 70.54, 75.77, -95.00, -85.77, -83.54,
               -72.31, -63.08, -53.86, -48.61, -44.38, -40.15, -20.92, -10.30,
               1.54, 12.77, 20.00, 39.23, 48.46, 57.69, 66.92, 76.15,
               85.38)

    loci <- data.frame(locus = locus, lengths = lengths,
                       type = type, id = seq(39, 1),
                       ymax = ymax, ymin = ymin,
                       hjust = hjust, vjust = vjust, angle = angle)

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