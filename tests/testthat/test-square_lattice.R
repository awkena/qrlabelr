test_that("Square lattice sample fieldbook successful load", {
  # skip_on_cran()
  
  expect_invisible(square_book <- qrlabelr::square_lattice)
  expect_true(class(square_book)[1] == "data.frame")
  expect_true(dim(square_book)[1] ==  216 )
  expect_true(dim(square_book)[2] ==  11)
  
})

