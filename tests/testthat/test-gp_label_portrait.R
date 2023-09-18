
test_that("Create plot label PDF successful generation", {
  #skip_on_cran()
  path <- tempdir()
  setwd(path)
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                    df$COLUMN)
                   
  expect_invisible(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = 0.625,
      bot_mar = 0.625,
      left_mar = 0.625,
      right_mar = 0.625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ))
  expect_true(length(list.files(path = ".", pattern = "\\.pdf$")) > 0)
  on.exit(unlink(path))
  # expect_true(length(list.files(path = ".", pattern = "\\.csv$")) > 0)
  
})

test_that("Create plot label input errors", {
  #skip_on_cran()
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = 2,
      bot_mar = 2,
      left_mar = 0.625,
      right_mar = 0.625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "Page setup does not match label setup per page."
  )
})

test_that("Create plot label input errors", {
  #skip_on_cran()
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 'A',
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = 0.625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "'wdt' must be a positive numeric value."
  )
})


test_that("Create plot label input errors", {
  #skip_on_cran()
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 'b', 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = 0.625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "'hgt' must be a positive numeric value."
  )
})

test_that("Create plot label input errors", {
  #skip_on_cran()
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 'c', 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = 0.625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "'page_wdt' must be a positive numeric value."
  )
})

test_that("Create plot label input errors", {
  #skip_on_cran()
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 'd',
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = 0.625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "'page_hgt' must be a positive numeric value."
  )
})

test_that("Create plot label input errors", {
  #skip_on_cran()
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = 'bb',
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = 0.625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "'top_mar' must be a positive numeric value."
  )
})


test_that("Create plot label input errors", {
  #skip_on_cran()
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = 'cc',
      left_mar = 0.625,
      right_mar = 0.625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "'bot_mar' must be a positive numeric value."
  )
})

test_that("Create plot label input errors", {
  #skip_on_cran()
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 'aa',
      right_mar = 0.625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "'left_mar' must be a positive numeric value."
  )
})

test_that("Create plot label input errors", {
  #skip_on_cran()
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = 'abc',
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "'right_mar' must be a positive numeric value."
  )
})

test_that("Create plot label input errors", {
  #skip_on_cran()
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = 0.625,
      numrow = 'aa',
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "'numrow' must be a positive integer."
  )
})

test_that("Create plot label input errors", {
  #skip_on_cran()
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = 0.625,
      numrow = 8L,
      numcol = 'cc',
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "'numcol' must be a positive integer."
  )
})

test_that("Create plot label input errors", {
  #skip_on_cran()
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = .625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 'vv',
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "'font_sz' must be a positive numeric value."
  )
})

test_that("Create plot label input errors", {
  #skip_on_cran()
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = .625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = 2,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "'rounded' must be a logical or boolean value."
  )
})


test_that("Create plot label input errors", {
  #skip_on_cran()
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = .625,
      numrow = 8L,
      numcol = 3L,
      filename = 2,
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "'filename' must be string value."
  )
})

test_that("Create plot label input errors", {
  #skip_on_cran()
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = .625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 2, 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "'family' must be string value."
  )
})


test_that("Create plot label input errors", {
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  #skip_on_cran()
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = .625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = NULL,
      ec_level = 1
    ),
    "Unique IDs for generating QR codes are missing!!"
  )
})


test_that("Create plot label input errors", {
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  #skip_on_cran()
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = .625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt1_id = 1,
      bot_txt2_id = 'ids',
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "Invalid string entered for 'bot_txt1_id'"
  )
})

test_that("Create plot label input errors", {
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  #skip_on_cran()
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = .625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt2_id = 1,
      bot_txt3_id = 'LOCATION',
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "Invalid string entered for 'bot_txt2_id'"
  )
})

test_that("Create plot label input errors", {
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  #skip_on_cran()
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = .625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      bot_txt3_id = 1,
      cent_txt1_id = 'TREATMENT', 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "Invalid string entered for 'bot_txt3_id'"
  )
})

test_that("Create plot label input errors", {
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  #skip_on_cran()
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = .625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      cent_txt1_id = 1, 
      cent_txt2_id = 'REP', 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "Invalid string entered for 'cent_txt1_id'"
  )
})


test_that("Create plot label input errors", {
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  #skip_on_cran()
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = .625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      cent_txt2_id = 2, 
      cent_txt3_id = 'COLUMN', 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "Invalid string entered for 'cent_txt2_id'"
  )
})


test_that("Create plot label input errors", {
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  #skip_on_cran()
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = .625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      
      cent_txt3_id = 1, 
      cent_txt4_id = 'ROW', 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "Invalid string entered for 'cent_txt3_id'"
  )
})

test_that("Create plot label input errors", {
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  #skip_on_cran()
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = .625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      cent_txt4_id = 1, 
      top_txt1_id = 'PLOT',
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "Invalid string entered for 'cent_txt4_id'"
  )
})


test_that("Create plot label input errors", {
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  #skip_on_cran()
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = .625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      
      top_txt1_id = 1,
      top_txt2_id = 'IBLOCK',
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "Invalid string entered for 'top_txt1_id'"
  )
})


test_that("Create plot label input errors", {
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  #skip_on_cran()
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = .625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      top_txt2_id = 1,
      top_txt3_id = 'SEED_SOURCE',
      unique_id = 'ids',
      ec_level = 1
    ),
    "Invalid string entered for 'top_txt2_id'"
  )
})

test_that("Create plot label input errors", {
  df <- data.frame(LOCATION = rep("BAMBEY", 10), 
                   PLOT = 1001:1010, 
                   ROW = c(rep(1, 6), rep(2, 4)),
                   COLUMN = c(1:6, 1:4),
                   REP = rep(1, 10),
                   IBLOCK = c(rep(1, 6), rep(2, 4)),
                   TREATMENT = paste0("G-", 1:10),
                   SEED_SOURCE = rep("OFF_NUR", 10))
  
  df$ids <- paste0(df$LOCATION,'2023', '_PYT', '_', df$PLOT, '_', df$ROW, '_',
                   df$COLUMN)
  #skip_on_cran()
  expect_error(
    gp_label_portrait(
      dat = df,
      wdt = 2,
      hgt = 1, 
      page_wdt = 8.5, 
      page_hgt = 11,
      top_mar = .625,
      bot_mar = .625,
      left_mar = 0.625,
      right_mar = .625,
      numrow = 8L,
      numcol = 3L,
      filename = 'PlotLabel',
      font_sz = 10,
      family = 'sans', 
      rounded = TRUE,
      bot_txt1 = 'Rubi', 
      cent_txt2 = 'Rep:',  
      cent_txt3 = 'R:', 
      cent_txt4 = 'r:', 
      top_txt1 = 'P:', 
      top_txt2 = 'B:',
      top_txt3_id = 1,
      unique_id = 'ids',
      ec_level = 1
    ),
    "Invalid string entered for 'top_txt3_id'"
  )
})
