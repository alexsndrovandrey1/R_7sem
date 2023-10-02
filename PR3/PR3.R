library(nycflights13)
library(dplyr)
#Задание 1 кол-во датафреймов в nycflights13
data(package = "nycflights13")
#Задание 2 кол-во срок в каждом датафрейме
nrow(airlines)
nrow(airports)
nrow(flights)
nrow(planes)
nrow(weather)
#или можно так
data_list <- list(airlines, airports, flights, planes, weather)
row_data <- sapply(data_list, nrow)
print(row_data)
#Задание 3  кол-во столбцов в каждом датафрейме
ncol(airlines)
ncol(airports)
ncol(flights)
ncol(planes)
ncol(weather)
#или
data_list2 <- list(airlines, airports, flights, planes, weather)
col_data <- sapply(data_list2, ncol)
print(col_data)
#Задание 4 примерный вид датафреймов
dataframe <- airlines %>% glimpse()
print(dataframe)
dataframe2 <- airports %>% glimpse()
print(dataframe2)
dataframe3 <- flights %>% glimpse()
print(dataframe3)
dataframe4 <- planes %>% glimpse()
print(dataframe4)
dataframe5 <- weather %>% glimpse()
print(dataframe5)
#Задние 5 кол-во компаний перевозчиков
carriers <- airlines %>%
  select(carrier) %>%
  distinct() %>%
  nrow()
print(carriers)
#Задание 6 кол-во рейсов принятых в аэропорту John F Kennedy Intl в мае
flights_JFK <- flights %>%
  filter(month == 5 & dest == "JFK") %>%
  nrow()
print(flights_JFK)
#Задание 7 самый северный аэропорт
N_airports <- airports %>%
  arrange(desc(lat)) %>%
  head(1)
print(N_airports)
#Задание 8 самый высокогорный аэропорт
alpine_airport <- airports %>%
  arrange(desc(alt)) %>%
  head(1)
print(alpine_airport)
#Задание 9 бортовые номера у самых старых самолетов
bort_number_old_plane <- planes %>%
  arrange(year) %>%
  head(10) %>%
  select(tailnum)
print(bort_number_old_plane)
#Задание 10 средняя температура воздуха в JFK в сентябре
temp_sep <- weather %>%
  filter(month == 9 & origin == "JFK") %>%
  summarise(avg_temp = mean(temp, na.rm = TRUE))
grad_C <- (5/9) * (temp_sep$avg_temp - 32)
print(grad_C)
#Задание 11 самолет какой компании больше всего летал в июне\
col_fly <- flights %>% 
  filter(month == 6) %>% 
  group_by(carrier) %>% 
  summarize(num_flights = n()) %>% 
  arrange(desc(num_flights)) %>% 
  head(1)
print(col_fly)
#Задание 12 больше всего задержек в 2013 году
flight_delays <- flights %>% 
  filter(year == 2013) %>% 
  group_by(carrier) %>% 
  summarize(num_delays = sum(arr_delay > 0, na.rm = TRUE)) %>% 
  arrange(desc(num_delays)) %>% 
  head(1)
print(flight_delays)


