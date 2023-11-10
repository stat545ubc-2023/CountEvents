# ***Test 1.*** I will check if my function only accepts data frame or Tibble

test_that("count_events only accepts data frame or Tibble", {

  #make a vector to use as a test
  n_vector_test <- c(1, 2, 3, 4, 5)
  #make a variable to use as a test
  var_test <- "not a dataset"


  expect_error(count_events(n_vector_test, species, island), "Input 'data' must be a data frame or Tibble.") # A vector was used instead of a data frame or tibble, thus an error is expected
  expect_error(count_events(var_test, species, island), "Input 'data' must be a data frame or Tibble.") # A single variable was used instead of a data frame or tibble, thus an error is expected
})


# ***Test 2.*** I will check if my function handles invalid inputs for var1 and var2

test_that("count_events function handles invalid input", {

  #make a variable not present in the dataset
  var3 <- c(1, 2, 3, 4, 5)

  #using penguins as dataset
  data0 <- data.frame(var1 = c("1", "1", "2", "2", "1", "2"),
                      var2 = c("X", "Y", "X", "X", "Y", "Y"))

  expect_error(count_events(data0, var3, var2), "Variables 'var1' must exist in the input data.") # var3 is not in the dataset, thus an error is expected for var1
  expect_error(count_events(data0, var1, var3), "Variables 'var2' must exist in the input data.") # var3 is not in the dataset, thus an error is expected for var2
})

# ***Test 3.*** I will check if the function correctly counts events by 'var1' and 'var2'

test_that("count_events function correctly counts events", {

  #load necessary library
  library(dplyr)

  # Make a sample dataset
  data1 <- data.frame(var1 = c("A", "A", "B", "B", "A", "B"),
                     var2 = c("X", "Y", "X", "X", "Y", "Y"))

  # Call the count_events function
  result1 <- count_events(data1, var1, var2)

  # Check if the result contains the expected counts
  expect_equal(result1$count, c(1, 2, 2, 1))  #expect X:A = 1; X:B = 2; expect Y:A = 2; Y:B = 1;
})

# ***Test 4.*** I will check if the function handles NA values correctly

test_that("count_events function NA test", {

  #load necessary library
  library(dplyr)

  # Make a sample dataset
  data2 <- data.frame(var1 = c(NA, "A", "B", "B", "A", "B"), #added an NA in the place of "A"
                     var2 = c("X", "Y", "X", "X", NA, "Y")) #added an NA in the place of "Y"

  # Call the count_events function
  result2 <- count_events(data2, var1, var2)

  # Check if the result contains the expected counts
  expect_equal(result2$count, c(1, 2, 1))  #expect minus one row and minus one count for "Y"
})
