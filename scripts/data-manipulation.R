# Data manipulation

library(forcats)
library(readr)
library(dplyr)
library(tidyr)

# Basic intro to vectors
log_vec <- c(TRUE, FALSE, FALSE, TRUE)
class(log_vec)
integer_vec <- c(1L, 2L, 3L) # alternatively, 1:3
class(integer_vec)
char_vec <- c('Laura', 'Mary', 'Ma')
class(char_vec)
num_logi <- c(1, 4, 6, TRUE)
num_char <- c(1, 3, "10", 6)
as.numeric(num_char)
char_logi <- c("a", "b", TRUE)
tricky <- c("a", "b", "1", FALSE)

# Factors
sex_char <- c("male", "female", "female", "male", NA)
class(sex_char)
as.numeric(sex_char)

sex <- factor(c("male", "female", "female", "male", NA))
class(sex)
levels(sex)
as.numeric(sex)

fct_relevel(sex, c("male", "female"))

fct_recode(sex, "M" = "male", "F" = "female")

as.numeric(fct_explicit_na(sex))

# select and filter

surveys <- readr::read_csv("data_raw/surveys_complete_77_89.csv")
str(surveys)
class(surveys)

# select columns

dplyr::select(surveys, 1:3, 5:6) # by column index
select(surveys, year, species_id, hindfoot_length)
select(surveys, -day, -weight)
select(surveys, where(is.numeric))
select(surveys, where(anyNA))
select(surveys, ends_with("_id"))

# filter rows
filter(surveys, year == 1985)

foo <- filter(surveys, species_id == c("RM", "DO"))
table(foo$species_id)
foo2 <- filter(surveys, species_id %in% c("RM", "DO"))
table(foo2$species_id)
foo3 <- filter(surveys, species_id == "RM" | species_id == "DO")
table(foo3$species_id)

filter(surveys, !is.na(weight))
filter(surveys, is.na(weight) == FALSE)

filter(surveys, year %in% c(1980:1985))
test <- filter(surveys, year == 1980:1985)
table(test$year)
