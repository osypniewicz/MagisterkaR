#paczki do pracy
library(tidyverse)

#zaladowanie danych
data <- iris

# Policz średnią szerokość potal(petal width) , cały zestaw danych

#indeksowanie!!!!!
srednia <- mean(data[, 4])

# Policz medianę i odchylenie standardowe druga kolumna wiersze 10-15)

mediana <- median(data[10:15, 2])

odchylenie <- sd(data[10:15,2])

#policz srednia dla gatunku versicolor, zmienna petal.lenght

srednia.pl.versicolor <- mean(data[51:100, 3])

# policz srednią dla gatunku virginica zmienna pierwsza
srednia.pl.virginica <- mean(data[data$Species == "virginica",1])

# Podsumowanie

podsumowanie <- summary(data)

podsumowanie

#utworzenie kolumny na posdtawie ... sumy
# dodaj dane z kolumny nazwa do kolumny numer 
suma.dwa.i.trzy <- data$Sepal.Width+data[ ,3]

# Utworzenie kolumny na podstawie sumy jako nowa zniana w ramce

data$nasza.suma <- data$Sepal.Width + data$Petal.Length


#suma trzech kolumn dzielona przez 4
data$dziwne.cos <- (data$Sepal.Length+data$Sepal.Width+data$Petal.Length) /data$Petal.Width


# Średnia kolumny 1 2 jako nowa kolumna
srednia.jeden.dwa <- mean(c(data$Sepal.Length,data$Sepal.Width,data$Petal.Length))


#subset (wybór)ramki danych

data_mniejsza <- data[ ,1:5]

#subset wybór wierszy40 i 50 do 60 i kolumny 2 i 3

data_wybrane <-  data[c(40, 50:60),2:3]

# Tidyverse, paczka dplyr i funkcja select ####
#wybór z funkcją select - wykorzystanie nazw
#kolumna Sepal.Width        dplyr::select()- wywołuje select z paczki dplyr
data.3 <- dplyr::select(data, Sepal.Width)

#negatywne wybory
data.4 <- dplyr::select(data, -Species)
data.5 <- dplyr::select(data, -c(nasza.suma, dziwne.cos))
#zmiana pozycji
data.6 <- dplyr::select(data.5, Species, Petal.Length, Sepal.Length, Sepal.Width, Petal.Width)

#WybOr na podstawie początku nazwy
data.7 <- dplyr::select(data, dplyr::starts_with("petal"))

#wybór na podstawie konca nazwy
data.8 <- dplyr::select(data, dplyr::ends_with("length"))

#wybor na podstawie dowolnego dopasowania
data.9 <- dplyr::select(data,dplyr::contains("l.L"))

# Wybór zakresu
data.10 <- dplyr::select(data, Sepal.Length:Petal.Length)

# Wybór wierszy, tidyverse i filter ####
data.11 <- dplyr::filter(data,Petal.Length > 2&Species=="virginica")






