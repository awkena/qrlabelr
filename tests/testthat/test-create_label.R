
test_that("Create plot label PDF successful generation", {
  # skip_on_cran()
  path <- tempdir()
  setwd(path)
  expect_invisible(
    create_label(wdt = 2, 
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
             font_sz = 8,
             Treetag = FALSE,
             family = 'sans', 
             rounded = TRUE, 
             top_left_1 = paste("Plot:", 101:110), 
             top_left_2 = paste("Row:", c(rep(1, 6), rep(2, 4))), 
             top_right_1 = paste("Rep:", rep(1, 10)), 
             top_right_2 = paste("Col:", c(1:6, 1:4)), 
             center_right_1 = paste("iBLOCK:", c(rep(1, 6), rep(2, 4))), 
             center_right_2 = paste("Seed:", rep("OFF_NUR", 10)), 
             center_right_3 = rep("AWk", 10), 
             bottom_left_1 = paste("Loc:", rep("BAMBEY", 10)), 
             bottom_left_2 = paste0("G-", 1:10),
             unique_id = paste("KUMASI2023_PYT", c(101:110), 
                               c(rep(1, 6), rep(2, 4)), c(1:6, 1:4),
                                sep = "_") ))
  expect_true(length(list.files(path = ".", pattern = "\\.pdf$")) > 0)
  on.exit(unlink(path))
  # expect_true(length(list.files(path = ".", pattern = "\\.csv$")) > 0)
  
})

expect_error(create_label(wdt = 2, 
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
                      font_sz = 8,
                      Treetag = FALSE,
                      family = 'sans', 
                      rounded = TRUE, 
                      top_left_1 = paste("Plot:", 101:110), 
                      top_left_2 = paste("Row:", c(rep(1, 6), rep(2, 4))), 
                      top_right_1 = paste("Rep:", rep(1, 10)), 
                      top_right_2 = paste("Col:", c(1:6, 1:4)), 
                      center_right_1 = paste("iBLOCK:", c(rep(1, 6), rep(2, 4))), 
                      center_right_2 = paste("Seed:", rep("OFF_NUR", 10)), 
                      center_right_3 = rep("AWk", 10), 
                      bottom_left_1 = paste("Loc:", rep("BAMBEY", 10)), 
                      bottom_left_2 = paste0("G-", 1:10),
                      unique_id = paste("KUMASI2023_PYT", c(101:110), 
                                        c(rep(1, 6), rep(2, 4)), c(1:6, 1:4),
                                        sep = "_") ), 
             "Page setup does not match label setup per page.")

