

  test_that("add_border function works", {
    set.seed(123)
    pp <- add_border(x = data.frame(LOCATION = rep("BAMBEY", 12), 
                                   PLOT = 1001:1012,
                                   ROW = c(rep(1, 6), rep(2, 6)),
                                   COLUMN = c(1:6, 1:6),
                                   REP = rep(1, 12),
                                   TREATMENT = sample(paste0("G-", 1:12))),
                    row_id = "ROW",
                    col_id = "COLUMN",
                    rep_id = "REP",
                    trt_id = "TREATMENT",
                     text_sz = 3,
                    title = "My field layout", 
                    xlab = "Row", 
                    ylab = "Range")
    
  vdiffr::expect_doppelganger("test layout", pp)
  })
  
  
  test_that("Create add_border input error", {
    #skip_on_cran()
    expect_error(
      # Throw error message when a list object is provided
      add_border(x = list(LOCATION = rep("BAMBEY", 12), 
                          PLOT = 1001:1012,
                          ROW = c(rep(1, 6), rep(2, 6)),
                          COLUMN = c(1:6, 1:6),
                          REP = rep(1, 12),
                          TREATMENT = sample(paste0("G-", 1:12))),
                 text_sz = 3,
                 title = NULL), 
                 "Input field book must be a data frame object.")
  })