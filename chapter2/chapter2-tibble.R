install.packages("tibble")

library(tibble)

mtcars_data <- mtcars

mtcars_tibble <- tibble::as_tibble(mtcars)

mtcars_tibble
