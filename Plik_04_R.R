#21.01.2025
#praca z kolumnamii
library(tidyverse)

#wczytanie danych
data <- iris

#Nowa kolumna  podziel sepal length przez sepal width kolumna nazywa się iloraz
#data$iloraz <- (data$Sepal.Length / data$Sepal.Width)
data$iloraz <- (data$Sepal.Length / data$Sepal.Width)

#iloraz2
data <-  data |>
 #funkcja mutate mutate służy do tworzenia nowych kolumn
  dplyr::mutate(iloraz_2 = Sepal.Length / Sepal.Width)

#operacja na istniejącej kolumnie
#logarytm naturalny z petal

data <- data |>
  dplyr::mutate(Petal.Length = log(Petal.Length))


#dodaj stałą do kolumny
data <- data |>
dplyr::mutate(Petal.Length= Petal.Length +1)

#dodaj kolumnę Sepal.length - Petal length i policz pierwiastek z sepal width

data <- data |>
  dplyr::mutate(roznica= Sepal.Length- Petal.Length , # robimy 2 operację
                                                         Sepal.Width= sqrt( Sepal.Width))

#policzyć logarytm z pierwszych kolumn
data <- data |>                           #\(a) tworzy nie nazwaną funkcję
  dplyr::mutate(dplyr::across(dplyr::ends_with("th"), \(a) log10(a)))

#Wczytaj dane jeszcze raz
data2 <- iris

#operacje na wszystkich kolumnach, które są numeryczne

data2 <- data2 |>
  dplyr::mutate(dplyr::across(dplyr::where(\(x) is.numeric(x)), \(a) a^2)) # te dane nadpisują się w miejsu gdzie warunek jest spełniony

data3 <- iris

#zlogarytmować kolumny gdzie minimum jest większe od jeden

data3 <- data3 |>
  dplyr::mutate(dplyr::across(dplyr::where(\(y) is.numeric(y) &&  min(y)>1), \(z) log2(z)))


#wykonaj operację i zmień lokalizację
data4 <- data3 |>
  dplyr::mutate(kolumna_1= Petal.Length+1, .before = Petal.Length)


#wykonaj operację i porzuć kolumny
 data5 <- data3 |>
   dplyr::mutate(kolumna= Petal.Length - 500, .keep = "none")

#zmiana pozycji kolumny bez mutate
 data6 <- data3 |>
   dplyr::relocate(Petal.Length, .after = Sepal.Length)


 # wczytaj dane jeszcze raz
 data7 <- iris

 data7 <- data7 |>
   dplyr::mutate(id= 1:length(Sepal.Length))     #dodaliśmy id do kolumn
#tidyr- zmiana formatu ramki

data_long <- data7 |> # zmienia nam się ramka z typu szeroka na typ długa tidy explain na git hubie
  tidyr::pivot_wider(id_cols = id, names_from = Species, values_from = Sepal.Length: Petal.Width)


