context("Creating plot from dataframe")

test_that("plot_df returns correct plot without arguments", {
    df <- data.frame(CHROM = rep("chrMT", 16),
                     POS = c(750, 1438, 2706, 3106, 4216, 7028, 8935,
                             9389, 9899, 11251, 11719, 12633, 13368,
                             14766, 15326, 16294),
                     REF = c("A", "A", "A", "CN", "T", "C", "C", "A",
                             "T", "A", "G", "C", "G", "C", "A", "C"),
                     ALT = c("G", "G", "G", "C", "C", "T", "T", "G",
                             "C", "G", "A", "A", "A", "T", "G", "T"))
    p <- plot_df(df)
    vdiffr::expect_doppelganger("no args", p)
})

test_that("plot_df returns correct plot with pos_col argument", {
    df <- data.frame(CHROM = rep("chrMT", 16),
                     positions = c(750, 1438, 2706, 3106, 4216, 7028, 8935,
                                   9389, 9899, 11251, 11719, 12633, 13368,
                                   14766, 15326, 16294),
                     REF = c("A", "A", "A", "CN", "T", "C", "C", "A",
                             "T", "A", "G", "C", "G", "C", "A", "C"),
                     ALT = c("G", "G", "G", "C", "C", "T", "T", "G",
                             "C", "G", "A", "A", "A", "T", "G", "T"))
    p <- plot_df(df, pos_col = "positions")
    vdiffr::expect_doppelganger("pos_col", p)
})

test_that("plot_df returns correct plot with ref_col argument", {
    df <- data.frame(CHROM = rep("chrMT", 16),
                     POS = c(750, 1438, 2706, 3106, 4216, 7028, 8935,
                             9389, 9899, 11251, 11719, 12633, 13368,
                             14766, 15326, 16294),
                     reference = c("A", "A", "A", "CN", "T", "C", "C", "A",
                                   "T", "A", "G", "C", "G", "C", "A", "C"),
                     ALT = c("G", "G", "G", "C", "C", "T", "T", "G",
                             "C", "G", "A", "A", "A", "T", "G", "T"))
    p <- plot_df(df, ref_col = "reference")
    vdiffr::expect_doppelganger("ref_col", p)
})

test_that("plot_df returns correct plot with alt_col argument", {
    df <- data.frame(CHROM = rep("chrMT", 16),
                     POS = c(750, 1438, 2706, 3106, 4216, 7028, 8935,
                             9389, 9899, 11251, 11719, 12633, 13368,
                             14766, 15326, 16294),
                     REF = c("A", "A", "A", "CN", "T", "C", "C", "A",
                             "T", "A", "G", "C", "G", "C", "A", "C"),
                     alternate = c("G", "G", "G", "C", "C", "T", "T", "G",
                                   "C", "G", "A", "A", "A", "T", "G", "T"))
    p <- plot_df(df, alt_col = "alternate")
    vdiffr::expect_doppelganger("alt_col", p)
})

test_that("plot_df returns correct plot with all three cols arguments", {
    df <- data.frame(CHROM = rep("chrMT", 16),
                     positions = c(750, 1438, 2706, 3106, 4216, 7028, 8935,
                                   9389, 9899, 11251, 11719, 12633, 13368,
                                   14766, 15326, 16294),
                     reference = c("A", "A", "A", "CN", "T", "C", "C", "A",
                                   "T", "A", "G", "C", "G", "C", "A", "C"),
                     alternate = c("G", "G", "G", "C", "C", "T", "T", "G",
                                   "C", "G", "A", "A", "A", "T", "G", "T"))
    p <- plot_df(df, pos_col = "positions",
                 ref_col = "reference", alt_col = "alternate")
    vdiffr::expect_doppelganger("pos_col ref_col alt_col", p)
})

test_that("plot_df returns correct plot with show_loci_names = FALSE", {
    df <- data.frame(CHROM = rep("chrMT", 16),
                     POS = c(750, 1438, 2706, 3106, 4216, 7028, 8935,
                             9389, 9899, 11251, 11719, 12633, 13368,
                             14766, 15326, 16294),
                     REF = c("A", "A", "A", "CN", "T", "C", "C", "A",
                             "T", "A", "G", "C", "G", "C", "A", "C"),
                     ALT = c("G", "G", "G", "C", "C", "T", "T", "G",
                             "C", "G", "A", "A", "A", "T", "G", "T"))
    p <- plot_df(df, show_loci_names = FALSE)
    vdiffr::expect_doppelganger("show_loci_names F", p)
})

test_that("plot_df returns correct plot with show_loci_legend = FALSE", {
    df <- data.frame(CHROM = rep("chrMT", 16),
                     POS = c(750, 1438, 2706, 3106, 4216, 7028, 8935,
                             9389, 9899, 11251, 11719, 12633, 13368,
                             14766, 15326, 16294),
                     REF = c("A", "A", "A", "CN", "T", "C", "C", "A",
                             "T", "A", "G", "C", "G", "C", "A", "C"),
                     ALT = c("G", "G", "G", "C", "C", "T", "T", "G",
                             "C", "G", "A", "A", "A", "T", "G", "T"))
    p <- plot_df(df, show_loci_legend = FALSE)
    vdiffr::expect_doppelganger("show_loci_legend F", p)
})

# test_that("plot_df returns correct plot with show_var_labels = TRUE", {
#     df <- data.frame(CHROM = rep("chrMT", 16),
#                      POS = c(750, 1438, 2706, 3106, 4216, 7028, 8935,
#                              9389, 9899, 11251, 11719, 12633, 13368,
#                              14766, 15326, 16294),
#                      REF = c("A", "A", "A", "CN", "T", "C", "C", "A",
#                              "T", "A", "G", "C", "G", "C", "A", "C"),
#                      ALT = c("G", "G", "G", "C", "C", "T", "T", "G",
#                              "C", "G", "A", "A", "A", "T", "G", "T"))
#     p <- plot_df(df, show_var_labels = TRUE)
#     vdiffr::expect_doppelganger("show_var_labels T", p)
# })