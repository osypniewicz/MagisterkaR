# Powtórka; grupa 2, 31.01.2025

# Załaduj paczki {tidyverse}, {readxl}
library(tidyverse)
library(readxl)

# Stwórz jednowymiarowy wektor o pięciu elementach liczbowych
wektor1 <- c(1,2,3,4,5)

# Wybierz czwartą i trzecią (w tej kolejności) pozycję w utworzonym wektorze i zapisz jako nowy wektor
wektor1[c(3,4)]
# Wczytaj dane z iris dataset
data <- (iris)
# Wybierz drugą kolumnę i wszystkie wiersze
data[ ,2]
# Wybierz czwarty i trzydziesty wiersz oraz wszystkie kolumny - klasyczne indeksowanie
data[c(4,30), ]
# Wybierz wiersze 4, 8, 22 i kolumny Petal.Length oraz Sepal.Width - klasyczne indeksowanie
data[c(4,8,22), c("Petal.Length", "Sepal.Width")]
# Wybierz kolumnę Species korzystając z operatora $
data $Species
# Uwtórz nową kolumnę "Petal.Iloraz" w ramce danych, tak aby była ilorazem Petal.Length i Petal.Width
data$Petal.Iloraz <- data$Petal.Length/data$Petal.Width
# Wczytaj dane z adresu sieciowego, zwróć uwagę na separator
# https://support.staffbase.com/hc/en-us/article_attachments/360009197031/username.csv

data2 <- read.csv2("https://support.staffbase.com/hc/en-us/article_attachments/360009197031/username.csv")
data21 <- read_delim("https://support.staffbase.com/hc/en-us/article_attachments/360009197031/username.csv", delim = ";")
# Wczytaj dane z pliku csv na dysku
data3 <- read.csv("C:\Users\osypn\Desktop\Studia\geografia_fiz\1\dathaproces\GITHUB\MagisterkaR\R")
# Wczytaj dane z pliku excel na dysku, wyraźnie wskaż arkusz
data4 <- read_excel("R/data/data_msu.xlsx")
# {dplyr} i {tidyr}

# Wczytaj dane dotyczące pingwinów
pingwiny <- palmerpenguins::penguins
# Zmień nazwę species na gatunek
pingwiny <- rename(pingwiny, gatunek= species)
# Zmień wszystkie nazwy tak aby były pisane wielką literą
rename_with(pingwiny, .cols = everything(),\(nazwy) toupper(nazwy))
# Wybierz kolumny od bill_length_mm do body_mass_g
select(pingwiny, c(bill_length_mm:body_mass_g))
# dane12 <- pingwiny |> select(bill_length_mm:body_mass_g)

# Wybierz kolumny kończące się na "mm"
select(pingwiny, ends_with("mm"))
# Wybierz kolumny zawierające "th"
select(pingwiny, contains("th"))
# Wybierz kolumny niebędące species
select(pingwiny, -gatunek)
# Wybierz wiersze zawierające gatunek Adelie
filter(pingwiny, gatunek == "Adelie")
# Wybierz wiersze z wysypy Torgersena dotyczące samic pingwinów
filter(pingwiny, island=="Torgersen" , sex=="female")

# Wybierz wiersze zawierające gatunek Adelie i Gento
filter(pingwiny, gatunek &in& "Adelie")

# Uwtórz nową kolumnę bill_ratio jako iloraz bill_length_mm do bill_depth_mm
pingwiny <- mutate(pingwiny, bill_ratio= bill_length_mm/bill_depth_mm)
# Utwórz kolumnę id z numerem obserwacji (tip: 1:n())
pingwiny <- mutate(pingwiny, id=1:n())
# Zlogarytmuj w miejscu kolumnę body_mass_g
pingwiny <- mutate(pingwiny, body_mass_g=log(body_mass_g))
# Oblicz w miejscu pierwiastek ze wszystkich kolumn numerycznych
mutate(pingwiny, across(where(\(nazwa)is.numeric(nazwa)), \(nazwa)sqrt(nazwa)) )
# Zgrupuj ramkę ranych na podstawie zmiennej gatunek i wykonaj operację summarise (średnia) dla kolumn bill_length_mm i body_mass_g
group_by(pingwiny, gatunek) |>
  summarise(across(c(bill_length_mm, body_mass_g),\(x) mean(x,na.rm = TRUE)))#na.rm usuwa nam NA z danych
# Wykonaj operację summarise (mediana) dla kolumn bill_length_mm i body_mass_g, wskaż zmienną grupującą jako argument .by
summarise(pingwiny, across(c(bill_length_mm, body_mass_g),\(i) median(i, na.rm = TRUE)), .by = island)

# Zmień format ramki na dłuższy, wykorzystaj kolumny bill_length_mm i bill_depth_mm
pivot_longer(pingwiny, c(bill_length_mm, bill_depth_mm), names_to = "nazwa",values_to = "wartosci")

# Zmień format ramki na szerszy, tak aby każda zmienna była wyrażona dla każdej wyspy
pivot_wider(pingwiny,names_from = island, values_from = -id)
# Korzystając z danych geochemicznych połącz ze sobą ramki loi oraz bsi na podstawie zmiennej sample.id - dołącz do lewej
data5 <- read_excel("C:/Users/osypn/Desktop/Studia/geografia_fiz/1/dathaproces/GITHUB/MagisterkaR/R/data_msu.xlsx", sheet="loi")
data6 <- read_excel("C:/Users/osypn/Desktop/Studia/geografia_fiz/1/dathaproces/GITHUB/MagisterkaR/R/data_msu.xlsx", sheet="elemental")
data7 <- read_excel("C:/Users/osypn/Desktop/Studia/geografia_fiz/1/dathaproces/GITHUB/MagisterkaR/R/data_msu.xlsx", sheet="bsi")
left_join(data5,)
# Korzystając z danych geochemicznych połącz ze sobą ramki elemental oraz bsi na podstawie zmiennej sample.id - dołącz do prawej

# Korzystając z danych geochemicznych połącz ze sobą wszystkie trzy ramki w sposób całkowity
