library(dplyr)
library(nycflights13)
#Задание 1. Сколько встроенных в пакет nycflights13 датафреймов?
data(package = "nycflights13")
#Задание 2. Сколько строк в каждом датафрейме?
#1й способ
nrow(airlines)
nrow(airports)
nrow(flights)
nrow(planes)
nrow(weather)
#2й способ
data_list <- list(airlines, airports, flights, planes, weather)
row_data <- sapply(data_list, nrow)
cat(row_data)
#Задание 3. Сколько столбцов в каждом датафрейме?
#1й способ
ncol(airlines)
ncol(airports)
ncol(flights)
ncol(planes)
ncol(weather)
#2й способ
data_lisr2 <- list(airlines, airports, flights, planes, weather)
col_data <- sapply(data_lisr2, ncol)
cat(col_data)
#Задание 4 Как посмотреть примерный вид датафрейма?
dataframe <- airlines %>% glimpse()
dataframe
dataframe2 <- airports %>% glimpse()
dataframe2
dataframe3 <- flights %>% glimpse()
dataframe3
dataframe4 <- planes %>% glimpse()
dataframe4
dataframe5 <- weather %>% glimpse()
dataframe5
#Задание 5. Сколько компанаий- перевозчиков учитываются эти наборы данны?
carriers <- airlines %>%
  select(carrier) %>%
  distinct() %>%
  nrow()
cat(carriers)
#Задание 6. Сколько рейсов принял аэропорт JFK в мае?
flights_JFK <- flights %>%
  filter(month == 5 & dest == "JFK") %>%
  nrow()
cat(flights_JFK)
#Задание 7. Какой самый северный аэропорт?
N_airports <- airports %>%
  arrange(desc(lat)) %>%
  head(1)
cat(N_airports$name)
#Задание 8. Какой аэропорт самый высокогорный(выше уровня моря)?
alpine_airport <- airports %>%
  arrange(desc(alt)) %>%
  head(1)
cat(alpine_airport$name)
#Задание 9. Какие бортовые номера у самых старых самолетов?
bort_number_old_plane <- planes %>%
  arrange(year) %>%
  select(tailnum) %>%
  head(10)
bort_number_old_plane
#Задание 10. Какая средняя температура воздуха была в сентябре в аэропорту JFK (в град Цельсия)
temp_sep <- weather %>%
  filter(month == 9 & origin == "JFK") %>%
  summarise(avg_temp = mean(temp, na.rm = TRUE))
grad_C <- (5/9) * (temp_sep$avg_temp - 32)
grad_C
#Задание 11. Самолеты какой компании совершили больше всего вылетов в июне?
col_fly <- flights %>%
  filter(month == 6) %>%
  group_by(carrier) %>%
  summarise(num_flight = n()) %>%
  arrange(desc(num_flight)) %>%
  head(1)
col_fly
#Задание 12. Самолеты какой авиакомпании задерживались чаще других в 2013 году?
flight_delays <- flights %>%
  filter(year == 2013) %>%
  group_by(carrier) %>%
  summarise(num_delays = sum(arr_delay > 0, na.rm = TRUE)) %>%
  arrange(desc(num_delays)) %>%
  head(1)
flight_delays




