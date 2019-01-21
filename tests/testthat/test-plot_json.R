context("Creating plot from JSON file")

test_that("plot_json returns correct plot from vector without arguments", {
    p <- plot_json("json_vector.json")
    vdiffr::expect_doppelganger("vect no args", p)
})

test_that("plot_json returns correct plot from dataframe without arguments", {
    p <- plot_json("json_dataframe.json", json_format = "dataframe")
    vdiffr::expect_doppelganger("df no args", p)
})

test_that("plot_json returns correct plot from dataframe with pos_col argument", {
    p <- plot_json("json_dataframe.json", json_format = "dataframe",
                   pos_col = "POS")
    vdiffr::expect_doppelganger("df pos_col", p)
})

test_that("plot_json returns correct plot from dataframe with ref_col argument", {
    p <- plot_json("json_dataframe.json", json_format = "dataframe",
                   ref_col = "REF")
    vdiffr::expect_doppelganger("df ref_col", p)
})

test_that("plot_json returns correct plot from dataframe with alt_col argument", {
    p <- plot_json("json_dataframe.json", json_format = "dataframe",
                   alt_col = "ALT")
    vdiffr::expect_doppelganger("df alt_col", p)
})

test_that("plot_json returns correct plot from dataframe with all three cols arguments", {
    p <- plot_json("json_dataframe.json", json_format = "dataframe",
                   pos_col = "POS", ref_col = "REF", alt_col = "ALT")
    vdiffr::expect_doppelganger("df pos_col ref_col alt_col", p)
})

test_that("plot_json returns correct plot from vector with show_loci_names = FALSE", {
    p <- plot_json("json_vector.json", json_format = "vector",
                   show_loci_names = FALSE)
    vdiffr::expect_doppelganger("vect show_loci_names F", p)
})

test_that("plot_json returns correct plot from vector with show_loci_legend = FALSE", {
    p <- plot_json("json_vector.json", json_format = "vector",
                   show_loci_legend = FALSE)
    vdiffr::expect_doppelganger("vect show_loci_legend F", p)
})

test_that("plot_json returns correct plot from dataframe with show_loci_names = FALSE", {
    p <- plot_json("json_dataframe.json", json_format = "dataframe",
                   show_loci_names = FALSE)
    vdiffr::expect_doppelganger("df show_loci_names F", p)
})

test_that("plot_json returns correct plot from dataframe with show_loci_legend = FALSE", {
    p <- plot_json("json_dataframe.json", json_format = "dataframe",
                   show_loci_legend = FALSE)
    vdiffr::expect_doppelganger("df show_loci_legend F", p)
})
