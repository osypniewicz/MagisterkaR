#Skrypt dzien pierwszy

#Zaladuj biblioteki/paczki
library(tidyverse)

#dane z internetu
dane_internet <- readr::read_csv("https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv")

#dane z dysku
dane_dysk_01 <- readr::read_csv("C:/Users/osypn/Desktop/Studia/geografia_fiz/1/dathaproces/GITHUB/MagisterkaR/R/annual-enterprise-survey-2023-financial-year-provisional.csv")

#dane dysk  sciezka wzgledna
dane_dysk_02 <- readr::read_csv("R/annual-enterprise-survey-2023-financial-year-provisional.csv")


#zamiana kolumny tekst na liczbe

dane_dysk_02$Value <- as.numeric(dane_dysk_02$Value)

#parsowanie danych na liczbe
dane_dysk_01$Value <- readr::parse_number(dane_dysk_01$Value)

#sprawdzanie wiersza 748
dane_internet[748,"Value"]
