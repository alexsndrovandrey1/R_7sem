# Исследование метаданных DNS трафика

## Цель работы

1.  Зaкрепить практические навыки использования языка программирования R
    для обработки данных
2.  Закрепить знания основных функций обработки данных экосистемы
    tidyverse языка R
3.  Закрепить навыки исследования метаданных DNS трафика

## Исходные данные

1.  RStudio

## Задания

### Подготовка данных

1.  Импортируйте данные DNS

``` r
library(tidyverse)
```

    ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ✔ dplyr     1.1.2     ✔ readr     2.1.4
    ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ✔ ggplot2   3.4.4     ✔ tibble    3.2.1
    ✔ lubridate 1.9.3     ✔ tidyr     1.3.0
    ✔ purrr     1.0.2     
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()
    ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
library(dplyr)

data = read.csv("dns.log", header = FALSE, sep="\t", encoding = "UTF-8")
```

1.  Добавьте пропущенные данные о структуре данных (назначении столбцов)

``` r
header = read.csv("header.csv", encoding = "UTF-8", skip = 1, header = FALSE, sep = ',')$V1
colnames(data) = header
```

2.  Преобразуйте данные в столбцах в нужный формат

``` r
data$ts <- as.POSIXct(data$ts, origin="1970-01-01")
```

Выполняем преобразование столбца ts в формат POSIXct в объекте данных
data. Функция as.POSIXct() используется для преобразования значения в
формат POSIXct, который представляет дату и время. Аргумент data$ts
указывает на столбец ts в объекте данных data, который содержит значения
времени в числовом формате.

### Анализ

3.  Сколько участников информационного обмена в сети Доброй Организации?

``` r
number_of_praticipants <- union(unique(data$id.orig_h), unique(data$id.resp_h))
number_of_praticipants %>% length()
```

    [1] 1359

Выполняем объединение уникальных значений из столбцов id.orig_h и
id.resp_h в объекте данных data и сохраняет результат в переменной
number_of_praticipants. Функция unique() используется для получения
уникальных значений из указанных столбцов. Затем функция union()
используется для объединения этих уникальных значений в один вектор.
Далее вычисляем длину получившегося вектора, то есть кол-во участников.

4.  Какое соотношение участников обмена внутри сети и участников
    обращений к внешним ресурсам?

``` r
internal_ip_pattern <- c("192.168.", "10.", "100.([6-9]|1[0-1][0-9]|12[0-7]).", "172.((1[6-9])|(2[0-9])|(3[0-1])).")
internal_ips <- number_of_praticipants[grep(paste(internal_ip_pattern, collapse = "|"), number_of_praticipants)]
internal <- sum(number_of_praticipants %in% internal_ips)
external <- length(number_of_praticipants) - internal
ratio <- internal / external
cat(ratio)
```

    15.57317

-   Создаем переменную internal_ip_pattern, которая содержит шаблоны для
    внутренних IP-адресов. В данном случае, шаблоны включают “192.168.”,
    “10.”, “100.(\[6-9\]|1\[0-1\]\[0-9\]|12\[0-7\]).” и
    “172.((1\[6-9\])|(2\[0-9\])|(3\[0-1\])).”. Эти шаблоны соответствуют
    распространенным диапазонам внутренних IP-адресов.

-   Создаем переменную internal_ips, в которой используется функция
    grep() для поиска уникальных IP-адресов из переменной
    number_of_praticipants, которые соответствуют шаблонам внутренних
    IP-адресов, заданным в internal_ip_pattern.

-   Создаем переменные internal и external. Переменная internal
    вычисляет сумму уникальных IP-адресов из number_of_praticipants,
    которые присутствуют в internal_ips. Переменная external вычисляет
    количество уникальных IP-адресов в number_of_praticipants, которые
    не присутствуют в internal_ips.

-   Вычисляем отношение ratio между internal и external, то есть
    соотношение внутренних IP-адресов к внешним IP-адресам.

5.  Найдите топ-10 участников сети, проявляющих наибольшую сетевую
    активность.

``` r
top_activity <- data %>%
  group_by(ip=id.orig_h) %>%
  summarise(activity = n()) %>%
  arrange(desc(activity)) %>%
  head(10)
ip <- select(top_activity,ip)
ip
```

    # A tibble: 10 × 1
       ip             
       <chr>          
     1 10.10.117.210  
     2 192.168.202.93 
     3 192.168.202.103
     4 192.168.202.76 
     5 192.168.202.97 
     6 192.168.202.141
     7 10.10.117.209  
     8 192.168.202.110
     9 192.168.203.63 
    10 192.168.202.106

-   Функция group_by(ip=id.orig_h) группирует данные по уникальным
    значениям столбца id.orig_h, то есть IP-адресам отправителей.

-   Функция summarise(activity = n()) вычисляет количество записей
    (активность) для каждого уникального IP-адреса отправителя и создает
    столбец activity.

-   Функция arrange(desc(activity)) сортирует данные в порядке убывания
    значения столбца activity.

6.  Найдите топ-10 доменов, к которым обращаются пользователи сети и
    соответственное количество обращений

``` r
top_domains <- data %>%
  group_by(domain = tolower(query)) %>%
  summarise(request = n()) %>%
  arrange(desc(request)) %>%
  head(10)
domains <- select(top_domains, domain)
domains
```

    # A tibble: 10 × 1
       domain                                                                   
       <chr>                                                                    
     1 "teredo.ipv6.microsoft.com"                                              
     2 "tools.google.com"                                                       
     3 "www.apple.com"                                                          
     4 "time.apple.com"                                                         
     5 "safebrowsing.clients.google.com"                                        
     6 "wpad"                                                                   
     7 "*\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00\\x00"
     8 "isatap"                                                                 
     9 "44.206.168.192.in-addr.arpa"                                            
    10 "hpe8aa67"                                                               

-   Функция group_by(domain = tolower(query)) группирует данные по
    уникальным значениям столбца query (запрос), приведенным к нижнему
    регистру с помощью tolower().

-   Функция summarise(request = n()) вычисляет количество записей
    (запросов) для каждого уникального доменного имени и создает столбец
    request, содержащий это количество.

-   Функция arrange(desc(request)) сортирует данные в порядке убывания
    значения столбца request, то есть по количеству запросов.

7.  Опеределите базовые статистические характеристики (функция
    summary()) интервала времени между последовательным обращениями к
    топ-10 доменам.

``` r
top_domains_filter <- data %>% 
  filter(tolower(query) %in% top_domains$domain) %>%
  arrange(ts)
time <- diff(top_domains_filter$ts)
summary(time)
```

      Length    Class     Mode 
      137205 difftime  numeric 

8.  Часто вредоносное программное обеспечение использует DNS канал в
    качестве канала управления, периодически отправляя запросы на
    подконтрольный злоумышленникам DNS сервер. По периодическим запросам
    на один и тот же домен можно выявить скрытый DNS канал. Есть ли
    такие IP адреса в исследуемом датасете?

``` r
ip_domains <- data %>%
  group_by(ip = tolower(id.orig_h), domain = tolower(query)) %>%
  summarise(request = n(), .groups = 'drop') %>%
  filter(request > 1)
unique_ips_periodic_requests <- unique(ip_domains$ip)
num_unique_ips <- length(unique_ips_periodic_requests)
head(unique_ips_periodic_requests)
```

    [1] "10.10.10.10"     "10.10.117.209"   "10.10.117.210"   "128.244.37.196" 
    [5] "169.254.109.123" "169.254.228.26" 

-   Функция group_by(ip = tolower(id.orig_h), domain = tolower(query))
    группирует данные по уникальным значениям столбцов id.orig_h
    (IP-адрес отправителя) и query (запрос), приведенным к нижнему
    регистру с помощью tolower().

-   Функция summarise(request = n(), .groups = ‘drop’) вычисляет
    количество записей (запросов) для каждой уникальной комбинации
    IP-адреса и доменного имени и создает столбец request, содержащий
    это количество. Аргумент .groups = ‘drop’ используется для удаления
    информации о группировке в результирующем наборе данных.

-   Функция filter(request \> 1) фильтрует данные, оставляя только те
    строки, где количество запросов (столбец request) больше 1.

-   Переменная unique_ips_periodic_requests содержит уникальные
    IP-адреса отправителей, которые имеют периодические запросы (более
    одного запроса для одной и той же комбинации IP-адреса и доменного
    имени).

-   Переменная num_unique_ips содержит количество уникальных IP-адресов
    из переменной unique_ips_periodic_requests.

### Обогащение данных

9.  Определите местоположение (страну, город) и организацию-провайдера
    для топ-10 доменов. Для этого можно использовать сторонние сервисы,
    например . https://ip2geolocation.com

<!-- -->

1.  tools.google.com

-   IP-адрес 142.250.186.142
-   Хост fra24s07-in-f14.1e100.net
-   Континент Северная Америка
-   Код страны US − USA − 840
-   Страна США
-   Широта 37°45’03.6”N (37.751°)
-   Долгота 97°49’19.2”W (−97.822°)
-   Часовой пояс America/Chicago (UTC −06:00)
-   Провайдер Google Servers
-   Домен 1e100.net
-   Домен страны .us

2.  www.apple.com

-   IP-адрес 17.253.144.10
-   Хост www.brkgls.com
-   Континент Северная Америка
-   Код страны US − USA − 840
-   Страна США
-   Широта 37°45’03.6”N (37.751°)
-   Долгота 97°49’19.2”W (−97.822°)
-   Часовой пояс America/Chicago (UTC −06:00)
-   Тип подключения Корпоративное
-   Провайдер Apple
-   Домен страны .us

3.  safebrowsing.clients.google.com

-   IP-адрес 142.250.181.238
-   Хост fra16s56-in-f14.1e100.net
-   Континент Северная Америка
-   Код страны US − USA − 840
-   Страна США
-   Код региона GA
-   Регион Джорджия
-   Почтовый индекс 30628
-   Широта 34°02’06.0”N (34.035°)
-   Долгота 83°13’08.8”W (−83.2191°)
-   Часовой пояс America/New York (UTC −05:00)
-   Тип подключения Кабель/DSL
-   Провайдер Google Servers
-   Домен 1e100.net
-   Домен страны .us

## Вывод

Были изучены возможности библиотек tidyverse, readr.
