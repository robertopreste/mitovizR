context("Creating plot from VCF file")

test_that("plot_vcf returns correct plot without arguments", {
    p <- plot_vcf("sample_vcf.vcf")
    vdiffr::expect_doppelganger("no args", p)
})

test_that("plot_vcf returns correct plot with show_loci_names = FALSE", {
    p <- plot_vcf("sample_vcf.vcf", show_loci_names = FALSE)
    vdiffr::expect_doppelganger("show_loci_names F", p)
})

test_that("plot_vcf returns correct plot with show_loci_legend = FALSE", {
    p <- plot_vcf("sample_vcf.vcf", show_loci_legend = FALSE)
    vdiffr::expect_doppelganger("show_loci_legend F", p)
})

test_that("plot_vcf returns correct plot from multiple samples", {
    p <- plot_vcf("sample_multi.vcf")
    vdiffr::expect_doppelganger("multi no args", p)
})

test_that("plot_vcf returns correct plot from multiple sample with show_loci_names = FALSE", {
    p <- plot_vcf("sample_multi.vcf", show_loci_names = F)
    vdiffr::expect_doppelganger("multi show_loci_names F", p)
})

test_that("plot_vcf returns correct plot from multiple sample with show_loci_legend = FALSE", {
    p <- plot_vcf("sample_multi.vcf", show_loci_legend = F)
    vdiffr::expect_doppelganger("multi show_loci_legend F", p)
})
