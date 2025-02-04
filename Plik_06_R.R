#ggplot
library(tidyverse)

zab_hydrochemia <- read.csv("C:/Users/osypn/Desktop/Studia/geografia_fiz/1/dathaproces/GITHUB/MagisterkaR/R/zab_hydrochemistry-lake.csv") |>
  mutate(date= lubridate::ymd(date))

#zmiana zawartości Ca w czasie x= czas   y = ca
ggplot(zab_hydrochemia, aes(date, ca))+
  geom_line()

#pokolorowanie serii, dane były połączone z 2 głębokości x=czas
ggplot(zab_hydrochemia, aes(date, ca, colour = depth))+
  geom_line()

#głębokość jako wartość dyskretna
ggplot(zab_hydrochemia, aes(date, ca, colour = as.factor(depth)))+
  geom_line()
# rozbicie wykresów na 2
ggplot(zab_hydrochemia, aes(date, ca, colour = as.factor(depth)))+ geom_line() +facet_wrap(dplyr::vars(depth))

ggplot(zab_hydrochemia, aes(date, ca, colour = as.factor(depth)))+ geom_line() +facet_wrap(dplyr::vars(depth), ncol = 1)


# wykresserie pokolorowane, głębokość jako wartość dyskretne, brak tła linie osi tworzenie skorek
ggplot(zab_hydrochemia, aes(date, ca, colour = as.factor(depth)))+ geom_line() +facet_wrap(dplyr::vars(depth), ncol = 1)+ theme(panel.background = element_blank())
ggplot(zab_hydrochemia, aes(date, ca, colour = as.factor(depth)))+ geom_line() + scale_color_viridis_d()+ facet_wrap(dplyr::vars(depth), ncol = 1)+ theme(panel.background = element_blank())+ labs(x="Data rate", y="Ca(mg/L)", title = "wykres glebokosc stezenie", subtitle = "nie do końca", color= "Głębokość(m)")


zab_temp <- read.csv("C:/Users/osypn/Desktop/Studia/geografia_fiz/1/dathaproces/GITHUB/MagisterkaR/R/zab_temperature-daily.csv") |> mutate(day=lubridate::ymd(day))

ggplot(zab_temp,aes(day, temp_01))+
  geom_point() +
  geom_line() +
  geom_smooth()



ggplot(zab_temp,aes(day, temp_01))+
  geom_point() +
  geom_line(color="red")


zab_temp |>
  pivot_longer(cols = -day, names_to = "glebokosc", values_to = "temperatura") |>  ggplot(aes(day, temperatura))+ geom_line()+ facet_wrap(vars(glebokosc))

zab_temp |>
  pivot_longer(cols = -day, names_to = "glebokosc", values_to = "temperatura") |>  ggplot(aes(day, temperatura))+ geom_line()+ facet_wrap(vars(glebokosc),ncol = 1, scales = "free")












