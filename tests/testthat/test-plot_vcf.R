context("Creating plot from VCF file")

test_that("plot_vcf returns correct plot without arguments", {
    p <- plot_vcf("HG00119.vcf")
    vdiffr::expect_doppelganger("no args", p)
})

test_that("plot_vcf returns correct plot with show_loci_names = FALSE", {
    p <- plot_vcf("HG00119.vcf", show_loci_names = FALSE)
    vdiffr::expect_doppelganger("show_loci_names F", p)
})

test_that("plot_vcf returns correct plot with show_loci_legend = FALSE", {
    p <- plot_vcf("HG00119.vcf", show_loci_legend = FALSE)
    vdiffr::expect_doppelganger("show_loci_legend F", p)
})
