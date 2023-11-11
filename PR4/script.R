library(tidyverse)
library(dplyr)

#Задание 1 Импорт данных
data = read.csv("dns.log", header = FALSE, sep = "\t", encoding = "UTF-8")
data %>% glimpse()

data = read.csv("dns.log", header = FALSE, sep="\t", encoding = "UTF-8")
data

#Задание 2 добавить данные о структуре данный
header = read.csv("header.csv", encoding = "UTF-8", skip = 1, header = FALSE, sep = ',')$V1
colnames(data) = header

#Задание 3 преобразуем данные в столбцах в нужный формат
data$ts <- as.POSIXct(data$ts, origin="1970-01-01")

#Задание 4 Сколько участников информационного обмена в сети Доброй Организации?
number_of_praticipants <- union(unique(data$id.orig_h), unique(data$id.resp_h))
number_of_praticipants %>% length()

#Задание 5 Какое соотношение участников обмена внутри сети и участников обращений к внешним ресурсам?
internal_ip_pattern <- c("192.168.", "10.", "100.([6-9]|1[0-1][0-9]|12[0-7]).", "172.((1[6-9])|(2[0-9])|(3[0-1])).")
internal_ips <- number_of_praticipants[grep(paste(internal_ip_pattern, collapse = "|"), number_of_praticipants)]
internal <- sum(number_of_praticipants %in% internal_ips)
external <- length(number_of_praticipants) - internal
ratio <- internal / external
cat(ratio)

#Задание 6 . Найдите топ-10 участников сети, проявляющих наибольшую сетевую активность
top_activity <- data %>%
  group_by(ip=id.orig_h) %>%
  summarise(activity = n()) %>%
  arrange(desc(activity)) %>%
  head(10)
ip <- select(top_activity,ip)
ip

#Задание 7 Найдите топ-10 доменов, к которым обращаются пользователи сети и соответственное количество обращений
top_domains <- data %>%
  group_by(domain = tolower(query)) %>%
  summarise(request = n()) %>%
  arrange(desc(request)) %>%
  head(10)
domains <- select(top_domains, domain)
domains

#Задание 8  Опеределите базовые статистические характеристики (функция summary()) интервала времени между последовательным обращениями к топ-10 доменам

top_domains_filter <- data %>% 
  filter(tolower(query) %in% top_domains$domain) %>%
  arrange(ts)
time <- diff(top_domains_filter$ts)
summary(time)

#Задание 9 
ip_domains <- data %>%
  group_by(ip = tolower(id.orig_h), domain = tolower(query)) %>%
  summarise(request = n(), .groups = 'drop') %>%
  filter(request > 1)
unique_ips_periodic_requests <- unique(ip_domains$ip)
num_unique_ips <- length(unique_ips_periodic_requests)
head(unique_ips_periodic_requests)