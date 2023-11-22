library(tidyverse)
library(lubridate)
#1ыыы
data <- read.csv("mir.csv-01.csv")

#2 Общая структура 
glimpse(data)

#Анализ
#1 Определите небезопасные точки доступа (без шифрования - OPN)
unsafe <- subset(data, Privacy == " OPN")
num <- nrow(unsafe)
cat(num)

#3 Выявить устройства, использующие последнюю версию протокола шифрования WPA3, и названия точек доступа, реализованных на этих устройствах

wpa3_devices <- subset(data, Privacy == " WPA3 WPA2") # устройства
wpa3_aps <- subset(data, Privacy == " WPA3 WPA2", select = ESSID) # названия точек доступа

#4 Отсортировать точки доступа по интервалу времени, в течение которого они находились на связи, по убыванию.
sorted_aps <- wpa3_devices %>%
  mutate(Duration = difftime(Last.time.seen, First.time.seen, units = "secs")) %>%
  select(ESSID, First.time.seen, Last.time.seen, Duration) %>%
  arrange(desc(Duration))


#5 Обнаружьте топ-10 самых быстрых точек доступа
top_10_fastest_ap <- data %>% arrange(desc(Speed)) %>% head(10)

#6 
sorted_beacons <- wpa3_devices %>%
  select(ESSID, First.time.seen, Last.time.seen, X..beacons) %>%
  arrange(desc(X..beacons))








