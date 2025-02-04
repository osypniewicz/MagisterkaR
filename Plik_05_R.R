library(tidyverse)
library(readxl)

data <- iris

#dodawanie id do danych kwiatowych
data <- data |>  mutate(id=1:dplyr::n())
#zmiana nazwy na pisane malą literą
data <- dplyr::rename_with(.data = data, .cols = everything(),\(a) tolower(a))

#Pivotowanie
#Długi format
data_long <-  data |> tidyr::pivot_longer(-c(id,species), names_to = "nazwy", values_to = "wartosc")

#szeroki format
data_wide <- data_long |>  tidyr::pivot_wider(names_from = nazwy, values_from = wartosc)
#szybki ggplot
#kolorowanie wg kolumny
data |> ggplot2::ggplot(aes(id,petal.length,colour = species)) + geom_line() + facet_wrap(vars(species), scales = "free")

#Dodawanie pustych wartości

data_na <- data
data_na[c(49,68),3] <- NA
data_na <- data_na |>  tidyr::drop_na()



#joins operacje na tabelach
#wylistowanie arkuszy w pliku excel
readxl::excel_sheets("R/data_msu.xlsx")

data1 <-  readxl::read_excel("R/data_msu.xlsx", sheet = "loi")

data2 <-  readxl::read_excel("R/data_msu.xlsx", sheet = "elemental")

data3 <- readxl::read_excel("R/data_msu.xlsx", sheet = "bsi")

# Łączenie ramek (mutating join)
# Left join
data4 <- left_join(data1, data2)

data5 <- left_join(data1, data3)

data6 <- left_join(data1, data3, by = join_by(sample.id))

data7 <- left_join(data1, data3, by = join_by(sample.id == sample.id))
# Łączenie do prawej ramki
data8 <- right_join(data2, data3)

# Łączenie wszystkiego - full
data9 <- full_join(data3, data1, by = join_by(sample.id))
# Łączenie z porzuceniem rzeczy bez pary
data10 <- inner_join(data1, data2)
#semi join
data11 <- semi_join(data1, data3, by = join_by(sample.id))

#anti join
data12 <- anti_join(data1, data2, by = join_by(sample.id))


























