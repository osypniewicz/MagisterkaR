# paczki
library(tidyverse)

data <- iris

#zla nazwa
data$'nazwa_niezgodna_ze_skladnia' <- 1

#zmiana nazwy kolumn z rename, po lewej nowa wartość po prawej stara nazwa
data <- dplyr::rename(data, sepal_length=Sepal.Length)

# zmiana kilku kolumn z funkcją
data <- dplyr::rename_with(data, .cols = everything(),\(i) tolower(i))
funkcja_ola <-  function(argument1, argument2) {
  argument1+argument2
}


#użycie funkcji
funkcja_ola(argument=1, argument=2)
#zmiana na duże litery
#zmiana kilku kolumn z funkcją
data <- dplyr::rename_with(.data = data, .cols = dplyr::everything(), \(nazwy) toupper(nazwy))

#doklejenie fragmentu tekstu, tworzymy tekst lubie arg1 , lubie arg 2 itp
znaki <- c("jablko", "pomarancze","mango")


znaki2 <- paste(znaki, "lubie")
znaki2

data <- dplyr::rename_with(data, .cols = dplyr::starts_with("sepal"), \(nazwy) paste(nazwy, "ug"))

#Podssumowanie dla data
summary(data)

#drukuj print
data


#struktura 1 typ

str(data)

data_grupowanie <- dplyr::group_by(data, SPECIES)
str(data_grupowanie)


#liczenie podsumowanie i srednia
data_srednia <- dplyr::summarise(data, mediana=dplyr::across(PETAL.LENGTH:PETAL.WIDTH, \(kolumna) median(kolumna)),
                                 minimum=dplyr::across(PETAL.LENGTH:PETAL.WIDTH, \(kolumna) min(kolumna)), .by = SPECIES)

#data <- dzialanie1
#data <- dzialanie2
#data <- dzialanie3

wektor_liczowy <- c(1,2,3,4,5)          #tworzenie danych

wektor_liczowy <- mean(wektor_liczowy)

wektor_liczbowy2 <- mean(c(1,2,3,4,5))

wektor_liczbowy3 <- c(1,2,3,4,5) |>

  mean() |> #liczenie sredniej
  sqrt() |> #liczenie pierwiastka (sqrt(mean(c(1,2,3,4,5))))











