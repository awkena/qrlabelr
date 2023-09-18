
test_that("RCBD sample fieldbook successful load", {
  # skip_on_cran()
  
  expect_invisible(rcbd_book <- qrlabelr::rcbd)
  expect_true(class(rcbd_book)[1] == "data.frame")
  expect_true(dim(rcbd_book)[1] ==  144 )
  expect_true(dim(rcbd_book)[2] ==  7 )
  
})

