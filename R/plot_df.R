#' Plot variants from a dataframe
#'
#' Adds a geom_point layer to the output of \code{\link{mito_plot}} showing
#' mitochondrial variants contained in the given dataframe.
#'
#' @param dataframe Name of the input dataframe
#' @param pos_col Name of column containing variants position (default = "POS")
#' @param ref_col Name of column containing variants reference allele (default = "REF")
#' @param alt_col Name of column containing variants alternate allele (default = "ALT")
#' @param sample_col Name of column containing sample name for each variant (default = "SAMPLE")
#' @param gt_col Name of column containing GT information, mostly from VCF files (default = "GT")
#' @param hf_col Name of column containing HF information, mostly from VCF files (default = "HF")
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

plot_df <- function(dataframe, pos_col = "POS", ref_col = "REF", alt_col = "ALT",
                    sample_col = "SAMPLE", gt_col = "GT", hf_col = "HF",
                    show_loci_names = TRUE, show_loci_legend = TRUE,
                    show_var_labels = FALSE, title = "",
                    save_plot = FALSE, save_to = "mitoviz_plot.png") {
    pos_col_idx <- which(colnames(dataframe) == pos_col)
    dataframe[, pos_col_idx] <- as.numeric(dataframe[, pos_col_idx])
    ref_col_idx <- which(colnames(dataframe) == ref_col)
    dataframe[, ref_col_idx] <- as.character(dataframe[, ref_col_idx])
    alt_col_idx <- which(colnames(dataframe) == alt_col)
    dataframe[, alt_col_idx] <- as.character(dataframe[, alt_col_idx])

    if (sample_col %in% colnames(dataframe)) {
        sample_col_idx <- which(colnames(dataframe) == sample_col)
        dataframe[, sample_col_idx] <- as.character(dataframe[, sample_col_idx])
    } else {
        dataframe$SAMPLE <- "SAMPLE"
    }
    if (gt_col %in% colnames(dataframe)) {
        gt_col_idx <- which(colnames(dataframe) == gt_col)
        dataframe[, gt_col_idx] <- as.character(dataframe[, gt_col_idx])
    } else {
        dataframe$GT <- "0/1"
    }
    if (hf_col %in% colnames(dataframe)) {
        hf_col_idx <- which(colnames(dataframe) == hf_col)
    } else {
        dataframe$HF <- 0.5
        hf_col_idx <- which(colnames(dataframe) == "HF")
    }
    dataframe[, hf_col_idx] <- as.double(dataframe[, hf_col_idx])
    dataframe$x_col <- 3 + dataframe[, hf_col_idx]
    dataframe$var_label <- paste0(dataframe[, pos_col_idx],
                                      dataframe[, ref_col_idx], ">",
                                      dataframe[, alt_col_idx])
    p <- mito_plot(show_loci_names = show_loci_names,
                   show_loci_legend = show_loci_legend) +
        geom_point(data = dataframe,
                   mapping = aes_string(x = "x_col", y = pos_col)) +
        labs(title = title)
    if (show_var_labels == TRUE) {
        p <- p +
            geom_label_repel(data = dataframe,
                             mapping = aes_string(x = "x_col", y = pos_col,
                                                  label = "var_label"))
    }
    if (save_plot == TRUE) {
        ggsave(filename = save_to, plot = p,
               height = 10.7, width = 9.46, units = "in")
    }

    return(p)
}
