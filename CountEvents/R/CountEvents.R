#' @title Count events in a data frame using two variable
#'
#' @description
#' This function takes a data frame or Tibble, and two variable names as arguments.
#' It performs data validation, filtering out rows with missing values.
#' counts the number of events in the data, grouped by the two specified variables, and returns the result as a data frame.
#'
#' @param data A data frame or Tibble containing the dataset to analyze, thus data.
#' @param var1 The first variable used for grouping and event counting, thus var1.
#' @param var2 The second variable used for grouping and event counting, thus var2.
#'
#' @return A data frame containing counts of events for each unique combination of
#'   the specified variables.
#'
#' @examples
#' # Example usage:
#' library(dplyr)
#' my_data <- data.frame(var1 = c(NA, "A", "B", "B", "A", "B"), var2 = c("X", "Y", "X", "X", NA, "Y"))
#' my_result <- count_events(my_data, var1, var2)
#'
#' @export

count_events <- function(data, var1, var2) {

  # Check if data is a data frame or Tibble
  if (!is.data.frame(data) && !is(data, "tbl_df")) {
    stop("Input 'data' must be a data frame or Tibble.")
  }

  # Check if var1 is present in data
  if (!(dplyr::quo_name(dplyr::enquo(var1)) %in% names(data))) {
    stop("Variables 'var1' must exist in the input data.")
  }
  # Check if var2 is present in data
  if (!(dplyr::quo_name(dplyr::enquo(var2)) %in% names(data))) {
    stop("Variables 'var2' must exist in the input data.")
  }

  # Filters out any NA values
  filtered_data <- tidyr::drop_na(data)


  #function to group by variables and return the count as a new column
  result <- filtered_data %>%
    dplyr::group_by({{var1}}, {{var2}}) %>%
    dplyr::summarise(count = n()) %>%
    dplyr::ungroup()
  return(result)
}


