context("Creating basic mitochondrial plot")

test_that("mito_plot returns correct plot without arguments", {
    p <- mito_plot()
    vdiffr::expect_doppelganger("base plot no arguments", p)
})

test_that("mito_plot returns correct plot with show_loci_names = FALSE", {
    p <- mito_plot(show_loci_names = FALSE)
    vdiffr::expect_doppelganger("base plot show_loci_names FALSE", p)
})

test_that("mito_plot returns correct plot with show_loci_legend = FALSE", {
    p <- mito_plot(show_loci_legend = FALSE)
    vdiffr::expect_doppelganger("base plot show_loci_legend FALSE", p)
})

test_that("mito_plot returns correct plot with show_loci_names = FALSE show_loci_legend = FALSE", {
    p <- mito_plot(show_loci_names = FALSE, show_loci_legend = FALSE)
    vdiffr::expect_doppelganger("base plot show_loci_names FALSE show_loci_legend FALSE", p)
})
