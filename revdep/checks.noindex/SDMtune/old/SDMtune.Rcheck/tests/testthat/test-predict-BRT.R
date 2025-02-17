skip_on_cran()
skip_on_appveyor()

test_that("The ouput is correct", {
  data <- SDMtune:::t
  data@data <- data@data[, 1:4]
  m <- trainBRT(data = data, n.trees = 200, shrinkage = 0.001)
  pred <- predict(m@model, data@data)
  expect_equal(sum(pred >= 0), nrow(data@data))
  expect_equal(sum(pred <= 1), nrow(data@data))
})

