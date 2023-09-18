
test_that("QR code successful generation", {
  # skip_on_cran()
  
  expect_invisible(aa <- make_qrcode("KUMASI2023_PYT_101_1_1", 
                                               ec_level = 3))
  expect_true(class(aa)[1] == "rastergrob")
  expect_true(class(aa)[2] == "grob"  )
  expect_true(class(aa)[3] == "gDesc" )
  
})

test_that("Make QR code input errors", {
  # skip_on_cran()
  expect_error(make_qrcode(), "Please provide a unique ID.")
  expect_error(make_qrcode("KUMASI2023_PYT_101_1_1", 
                           ec_level = 4), "Please provide an error
                          correction level value in the range 0 - 3.")
  
  
})