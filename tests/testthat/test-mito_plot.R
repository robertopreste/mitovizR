context("Creating basic mitochondrial plot")

test_that("mito_plot returns correct plot without arguments", {
    p <- mito_plot()
    vdiffr::expect_doppelganger("no args", p)
})

test_that("mito_plot returns correct plot with show_loci_names = FALSE", {
    p <- mito_plot(show_loci_names = FALSE)
    vdiffr::expect_doppelganger("show_loci_names F", p)
})

test_that("mito_plot returns correct plot with show_loci_legend = FALSE", {
    p <- mito_plot(show_loci_legend = FALSE)
    vdiffr::expect_doppelganger("show_loci_legend F", p)
})

test_that("mito_plot returns correct plot with show_loci_names = FALSE show_loci_legend = FALSE", {
    p <- mito_plot(show_loci_names = FALSE, show_loci_legend = FALSE)
    vdiffr::expect_doppelganger("show_loci_names F show_loci_legend F", p)
})
