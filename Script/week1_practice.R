print("hello!")
2+2

install.packages("tidyverse")

library(tidyverse)

install.packages("AustralianPoliticians")
library(AustralianPoliticians)

#get_auspol is a function
get_auspol("all") |> # Imports data from GitHub
    as_tibble() |>
    filter(wasPrimeMinister == 1) |>
    count(gender)

get_auspol("all") |> # Imports data from GitHub
    head() 

australian_politicians <- #assignment operator
    get_auspol("all")

head(australian_politicians)

australian_politicians |>
    select(firstName)

#different way to get a column using $
australian_politicians$firstName |>
    head()

#remove column with "-"
australian_politicians |>
    select(-firstName)

#select column starts with "birth"
australian_politicians |>
    select(starts_with("birth"))

#select the column we want
australian_politicians <-
    australian_politicians |>
    select(
        uniqueID,
        surname,
        firstName,
        gender,
        birthDate,
        birthYear,
        deathDate,
        member,
        senator,
        wasPrimeMinister
    )

australian_politicians

#using filter to get people who were prime minister
australian_politicians |>
    filter(wasPrimeMinister == 1)

#two conditions in filter with &
australian_politicians |>
    filter(wasPrimeMinister == 1 & firstName == "Joseph")

#you can use comma as well
australian_politicians |>
    filter(wasPrimeMinister == 1, firstName == "Joseph")

#you can also use |
australian_politicians |>
    filter(firstName == "Myles" | firstName == "Ruth")

#using both filter() and select()
australian_politicians |>
    filter(firstName == "Ruth" | firstName == "Myles") |>
    select(firstName, surname)

#you can use row_number() == 345 in filter() function to get the particular row
australian_politicians |>
    filter(row_number() == 853)

#slice is easier
australian_politicians |>
    slice(853)

#slice(-1) to remove the first row
australian_politicians |>
    slice(-1)

#only keep the first three rows with 1:3
australian_politicians |>
    slice(1:3)

#duplicate the first two rows
australian_politicians |>
    slice(1:2, 1:n())

#arrange() to change the order
australian_politicians |>
    arrange(birthYear)

#change from ascending to descending
australian_politicians |>
    arrange(desc(birthYear))

#you can use a - with arrange as well
australian_politicians |>
    arrange(-birthYear)

#arrange can be more than one column
australian_politicians |>
    arrange(firstName, birthYear)

australian_politicians |>
    arrange(birthYear) |>
    arrange(firstName)

#the order matters
australian_politicians |>
    arrange(birthYear, firstName)

