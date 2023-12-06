# Практика 5

# Исследование информации о состоянии беспроводных сетей.

## Цель работы

1.  Получить знания о методах исследования радиоэлектронной обстановки.

2.  Составить представление о механизмах работы Wi-Fi сетей на канальном
    и сетевом уровне модели OSI.

3.  Зекрепить практические навыки использования языка программирования R
    для обработки данных.

4.  Закрепить знания основных функций обработки данных экосистемы
    tidyverse языка R.

## Исходные данные

1.  RStudio

## Задания

### Подготовка данных

2.  Импорт данных

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
library(lubridate)

data <- read.csv("mir.csv-01.csv")
```

3.  Просмотрите общую структуру данных с помощью функции glimpse()

``` r
glimpse(data)
```

    Rows: 12,249
    Columns: 15
    $ BSSID           <chr> "BE:F1:71:D5:17:8B", "6E:C7:EC:16:DA:1A", "9A:75:A8:B9…
    $ First.time.seen <chr> " 2023-07-28 09:13:03", " 2023-07-28 09:13:03", " 2023…
    $ Last.time.seen  <chr> " 2023-07-28 11:50:50", " 2023-07-28 11:55:12", " 2023…
    $ channel         <chr> "  1", "  1", "  1", "  7", "  6", "  6", " 11", " 11"…
    $ Speed           <chr> " 195", " 130", " 360", " 360", " 130", " 130", " 195"…
    $ Privacy         <chr> " WPA2", " WPA2", " WPA2", " WPA2", " WPA2", " OPN", "…
    $ Cipher          <chr> " CCMP", " CCMP", " CCMP", " CCMP", " CCMP", " ", " CC…
    $ Authentication  <chr> " PSK", " PSK", " PSK", " PSK", " PSK", "   ", " PSK",…
    $ Power           <chr> " -30", " -30", " -68", " -37", " -57", " -63", " -27"…
    $ X..beacons      <chr> "      846", "      750", "      694", "      510", " …
    $ X..IV           <chr> "      504", "      116", "       26", "       21", " …
    $ LAN.IP          <chr> "   0.  0.  0.  0", "   0.  0.  0.  0", "   0.  0.  0.…
    $ ID.length       <chr> "  12", "   4", "   2", "  14", "  25", "  13", "  12"…
    $ ESSID           <chr> " C322U13 3965", " Cnet", " KC", " POCO X5 Pro 5G", " …
    $ Key             <lgl> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA…

### Анализ

1.  Определить небезопасные точки доступа(без шифрования OPN)

``` r
unsafe <- subset(data, Privacy == " OPN")
num <- nrow(unsafe)
cat(num)
```

    42

``` r
unsafe
```

                    BSSID      First.time.seen       Last.time.seen channel Speed
    6   E8:28:C1:DC:B2:52  2023-07-28 09:13:03  2023-07-28 11:55:38       6   130
    15  E8:28:C1:DC:B2:50  2023-07-28 09:13:06  2023-07-28 11:55:12       6   130
    16  E8:28:C1:DC:B2:51  2023-07-28 09:13:06  2023-07-28 11:55:11       6   130
    18  E8:28:C1:DC:FF:F2  2023-07-28 09:13:06  2023-07-28 11:55:10       6    -1
    19  00:25:00:FF:94:73  2023-07-28 09:13:06  2023-07-28 11:56:21      44    -1
    24  E8:28:C1:DD:04:52  2023-07-28 09:13:09  2023-07-28 11:56:05      11   130
    25  E8:28:C1:DE:74:31  2023-07-28 09:13:13  2023-07-28 10:27:06       6   130
    26  E8:28:C1:DE:74:32  2023-07-28 09:13:13  2023-07-28 10:39:43       6   130
    29  E8:28:C1:DC:C8:32  2023-07-28 09:13:17  2023-07-28 11:52:32       1   130
    33  E8:28:C1:DD:04:50  2023-07-28 09:13:50  2023-07-28 11:43:39      11   130
    34  E8:28:C1:DD:04:51  2023-07-28 09:13:57  2023-07-28 10:48:00      11   130
    37  E8:28:C1:DC:C8:30  2023-07-28 09:15:45  2023-07-28 11:36:30       1   130
    39  E8:28:C1:DE:74:30  2023-07-28 09:17:45  2023-07-28 09:26:13       6    -1
    43  E0:D9:E3:48:FF:D2  2023-07-28 09:17:53  2023-07-28 10:51:37       7    -1
    46  E8:28:C1:DC:B2:41  2023-07-28 09:18:16  2023-07-28 11:36:43      48   360
    47  E8:28:C1:DC:B2:40  2023-07-28 09:18:16  2023-07-28 11:51:48      48   360
    48  00:26:99:F2:7A:E0  2023-07-28 09:18:17  2023-07-28 11:01:55       1    -1
    51  E8:28:C1:DC:B2:42  2023-07-28 09:18:30  2023-07-28 11:43:23      48   360
    52  E8:28:C1:DD:04:40  2023-07-28 09:18:30  2023-07-28 11:55:10      52   360
    53  E8:28:C1:DD:04:41  2023-07-28 09:18:30  2023-07-28 11:55:10      52   360
    56  E8:28:C1:DE:47:D2  2023-07-28 09:20:37  2023-07-28 11:51:18       1   130
    61  02:BC:15:7E:D5:DC  2023-07-28 09:24:46  2023-07-28 09:24:48      11   130
    67  E8:28:C1:DC:C6:B1  2023-07-28 09:32:42  2023-07-28 11:52:32       6   130
    71  E8:28:C1:DD:04:42  2023-07-28 09:34:57  2023-07-28 11:53:35      52   360
    73  E8:28:C1:DC:C8:31  2023-07-28 09:36:31  2023-07-28 11:36:30       1   130
    75  E8:28:C1:DE:47:D1  2023-07-28 09:40:06  2023-07-28 09:40:06       1   130
    79  00:AB:0A:00:10:10  2023-07-28 09:46:33  2023-07-28 11:15:49      60    -1
    84  E8:28:C1:DC:C6:B0  2023-07-28 09:59:19  2023-07-28 11:03:58       6   130
    86  E8:28:C1:DC:C6:B2  2023-07-28 10:02:42  2023-07-28 11:56:21       6    -1
    90  E8:28:C1:DC:BD:50  2023-07-28 10:16:31  2023-07-28 11:02:14      11   130
    91  E8:28:C1:DC:0B:B2  2023-07-28 10:20:20  2023-07-28 10:20:20      11    -1
    104 E8:28:C1:DC:33:12  2023-07-28 10:28:36  2023-07-28 10:51:35      11    -1
    106 00:03:7A:1A:03:56  2023-07-28 10:29:13  2023-07-28 10:29:19      11   130
    112 00:03:7F:12:34:56  2023-07-28 10:30:23  2023-07-28 10:30:23       6   130
    117 00:3E:1A:5D:14:45  2023-07-28 10:34:03  2023-07-28 10:34:05      11   130
    121 E0:D9:E3:49:00:B1  2023-07-28 10:35:31  2023-07-28 10:35:31       1   130
    122 E8:28:C1:DC:BD:52  2023-07-28 10:36:14  2023-07-28 10:36:14      11   130
    149 00:26:99:F2:7A:EF  2023-07-28 11:10:12  2023-07-28 11:10:12      44    -1
    150 02:67:F1:B0:6C:98  2023-07-28 11:16:05  2023-07-28 11:26:56      11   130
    156 02:CF:8B:87:B4:F9  2023-07-28 11:30:11  2023-07-28 11:30:11      11   130
    163 00:53:7A:99:98:56  2023-07-28 11:48:14  2023-07-28 11:48:14      11   130
    167 E8:28:C1:DE:47:D0  2023-07-28 11:55:11  2023-07-28 11:55:11       1   130
        Privacy Cipher Authentication Power X..beacons     X..IV           LAN.IP
    6       OPN                         -63        251      3430  172. 17.203.197
    15      OPN                         -63        260       907  172. 17. 95.169
    16      OPN                         -63        279         0    0.  0.  0.  0
    18      OPN                          -1          0         3  172. 17. 84.217
    19      OPN                          -1          0         5    0.  0.  0.  0
    24      OPN                         -67          4       304  172. 17.216.149
    25      OPN                         -82          2         0    0.  0.  0.  0
    26      OPN                         -69          1         2  172. 17. 93.250
    29      OPN                         -69         12        71  192.168.155. 53
    33      OPN                         -78         20        35  192.168.  0.  1
    34      OPN                         -73          9         0    0.  0.  0.  0
    37      OPN                         -71          7        21  172. 17.105.120
    39      OPN                         -78          0         6    0.  0.  0.  0
    43      OPN                          -1          0         2  192.168. 14.235
    46      OPN                         -89          5        23  169.254.175.203
    47      OPN                         -88          5        89  172. 17.203.197
    48      OPN                          -1          0         2    0.  0.  0.  0
    51      OPN                         -87          5         0    0.  0.  0.  0
    52      OPN                         -84         30       171  172. 17. 84.175
    53      OPN                         -83         25       282  172. 17. 84.175
    56      OPN                         -71          3        31    0.  0.  0.  0
    61      OPN                         -67          1         0    0.  0.  0.  0
    67      OPN                         -78          5         0    0.  0.  0.  0
    71      OPN                         -81         23         0    0.  0.  0.  0
    73      OPN                         -73          8         0    0.  0.  0.  0
    75      OPN                         -76          1         0    0.  0.  0.  0
    79      OPN                          -1          0        20    0.  0.  0.  0
    84      OPN                         -71          4         5    0.  0.  0.  0
    86      OPN                         -70          0        34  192.168.  0.  1
    90      OPN                         -75          5         0    0.  0.  0.  0
    91      OPN                         -82          0         1    0.  0.  0.  0
    104     OPN                         -82          0         1    0.  0.  0.  0
    106     OPN                         -68          1         0    0.  0.  0.  0
    112     OPN                         -76          1         0    0.  0.  0.  0
    117     OPN                         -57          1         0    0.  0.  0.  0
    121     OPN                         -70          1         0    0.  0.  0.  0
    122     OPN                         -72          1         0    0.  0.  0.  0
    149     OPN                          -1          0         1    0.  0.  0.  0
    150     OPN                         -68          1         0    0.  0.  0.  0
    156     OPN                         -70          1         0    0.  0.  0.  0
    163     OPN                         -68          0         0    0.  0.  0.  0
    167     OPN                         -70          1         0    0.  0.  0.  0
        ID.length          ESSID Key
    6          13  MIREA_HOTSPOT  NA
    15         12   MIREA_GUESTS  NA
    16          0                 NA
    18          0                 NA
    19          0                 NA
    24         13  MIREA_HOTSPOT  NA
    25          0                 NA
    26         13  MIREA_HOTSPOT  NA
    29         13  MIREA_HOTSPOT  NA
    33         12   MIREA_GUESTS  NA
    34          0                 NA
    37         12   MIREA_GUESTS  NA
    39          0                 NA
    43          0                 NA
    46         12   MIREA_GUESTS  NA
    47         13  MIREA_HOTSPOT  NA
    48          0                 NA
    51          0                 NA
    52         13  MIREA_HOTSPOT  NA
    53         12   MIREA_GUESTS  NA
    56         13  MIREA_HOTSPOT  NA
    61          7        MT_FREE  NA
    67          0                 NA
    71          0                 NA
    73          0                 NA
    75          0                 NA
    79          0                 NA
    84         12   MIREA_GUESTS  NA
    86          0                 NA
    90         12   MIREA_GUESTS  NA
    91          0                 NA
    104         0                 NA
    106         7        MT_FREE  NA
    112         7        MT_FREE  NA
    117         7        MT_FREE  NA
    121         0                 NA
    122        13  MIREA_HOTSPOT  NA
    149         0                 NA
    150         7        MT_FREE  NA
    156         7        MT_FREE  NA
    163         7        MT_FREE  NA
    167        12   MIREA_GUESTS  NA

2.  Определить производителя для каждого обнаруженного устройства:

-   E8:28:C1:DC:B2:52 - Eltex Enterprise Ltd
-   E8:28:C1:DC:B2:50 - Eltex Enterprise Ltd
-   E8:28:C1:DC:B2:51 - Eltex Enterprise Ltd
-   E8:28:C1:DC:FF:F2 - Eltex Enterprise Ltd
-   00:25:00:FF:94:73 - Apple, Inc
-   E8:28:C1:DD:04:52 - Eltex Enterprise Ltd
-   E8:28:C1:DE:74:31 - Eltex Enterprise Ltd
-   E8:28:C1:DE:74:32 - Eltex Enterprise Ltd
-   E8:28:C1:DC:C8:32 - Eltex Enterprise Ltd
-   E8:28:C1:DD:04:50 - Eltex Enterprise Ltd
-   E8:28:C1:DD:04:51 - Eltex Enterprise Ltd
-   E8:28:C1:DC:C8:30 - Eltex Enterprise Ltd
-   E8:28:C1:DE:74:30 - Eltex Enterprise Ltd
-   E0:D9:E3:48:FF:D2 - Eltex Enterprise Ltd
-   E8:28:C1:DC:B2:41 - Eltex Enterprise Ltd
-   E8:28:C1:DC:B2:40 - Eltex Enterprise Ltd
-   00:26:99:F2:7A:E0 - Cisco Systems, Inc
-   E8:28:C1:DC:B2:42 - Eltex Enterprise Ltd
-   E8:28:C1:DD:04:40 - Eltex Enterprise Ltd
-   E8:28:C1:DD:04:41 - Eltex Enterprise Ltd
-   E8:28:C1:DE:47:D2 - Eltex Enterprise Ltd
-   E8:28:C1:DC:C6:B1 - Eltex Enterprise Ltd
-   E8:28:C1:DD:04:42 - Eltex Enterprise Ltd
-   E8:28:C1:DC:C8:31 - Eltex Enterprise Ltd
-   E8:28:C1:DE:47:D1 - Eltex Enterprise Ltd
-   E8:28:C1:DC:C6:B0 - Eltex Enterprise Ltd
-   E8:28:C1:DC:C6:B2 - Eltex Enterprise Ltd
-   E8:28:C1:DC:BD:50 - Eltex Enterprise Ltd
-   E8:28:C1:DC:0B:B2 - Eltex Enterprise Ltd
-   E8:28:C1:DC:33:12 - Eltex Enterprise Ltd
-   00:03:7A:1A:03:56 - Taiyo Yuden Co., Ltd
-   00:03:7F:12:34:56 - Atheros Communications, Inc
-   E0:D9:E3:49:00:B1 - Eltex Enterprise Ltd
-   E8:28:C1:DC:BD:52 - Eltex Enterprise Ltd
-   00:26:99:F2:7A:EF - Cisco Systems, Inc
-   E8:28:C1:DE:47:D0 - Eltex Enterprise Ltd

3.  Выявить устройства, использующие последнюю версию протокола
    шифрования WPA3, и названия точек доступа, реализованных на этих
    устройствах

``` r
wpa3_devices <- subset(data, Privacy == " WPA3 WPA2", select = c(BSSID, ESSID, Privacy))
wpa3_devices
```

                    BSSID               ESSID    Privacy
    36  26:20:53:0C:98:E8                      WPA3 WPA2
    76  A2:FE:FF:B8:9B:C9          Christie’s  WPA3 WPA2
    82  96:FF:FC:91:EF:64                      WPA3 WPA2
    85  CE:48:E7:86:4E:33  iPhone (Анастасия)  WPA3 WPA2
    88  8E:1F:94:96:DA:FD  iPhone (Анастасия)  WPA3 WPA2
    89  BE:FD:EF:18:92:44            Димасик   WPA3 WPA2
    97  3A:DA:00:F9:0C:02   iPhone XS Max 🦊🐱🦊  WPA3 WPA2
    151 76:C5:A0:70:08:96                      WPA3 WPA2

-поняснение-

4.  Отсортировать точки доступа по интервалу времени, в течении которого
    они находились на связи, по убыванию

``` r
wpa3 <- subset(data, Privacy == " WPA3 WPA2")
sorted_aps <- wpa3 %>%
  mutate(Duration = difftime(Last.time.seen, First.time.seen, units = "secs")) %>%
  select(ESSID, First.time.seen, Last.time.seen, Duration) %>%
  arrange(desc(Duration))
sorted_aps
```

                    ESSID      First.time.seen       Last.time.seen  Duration
    1                      2023-07-28 09:52:54  2023-07-28 10:25:02 1928 secs
    2                      2023-07-28 09:15:45  2023-07-28 09:33:10 1045 secs
    3  iPhone (Анастасия)  2023-07-28 10:08:32  2023-07-28 10:15:27  415 secs
    4  iPhone (Анастасия)  2023-07-28 09:59:20  2023-07-28 10:04:15  295 secs
    5   iPhone XS Max 🦊🐱🦊  2023-07-28 10:27:01  2023-07-28 10:27:10    9 secs
    6            Димасик   2023-07-28 10:15:24  2023-07-28 10:15:28    4 secs
    7                      2023-07-28 11:16:36  2023-07-28 11:16:38    2 secs
    8          Christie’s  2023-07-28 09:41:52  2023-07-28 09:41:52    0 secs

Создаем список wpa3 и sorted_aps, вызываем функцию mutate, которая
добавляет новую переменную Duraction и функция difftime вычисляет
разницу между Last.time.seen и First.time.seen, units = “secs” -
указывает, что разница должна быть в секундах, далее выбираем нужные
столбцы и функцией arrange сортируем по убыванию.

5.  Обнаружить топ-10 самых быстрых точек доступа

``` r
top_10_fastest_ap <- data %>% 
  arrange(desc(Speed)) %>% 
  head(10) %>%
  select(BSSID, ESSID, Speed)
top_10_fastest_ap
```

                   BSSID               ESSID Speed
    1  26:20:53:0C:98:E8                       866
    2  96:FF:FC:91:EF:64                       866
    3  CE:48:E7:86:4E:33  iPhone (Анастасия)   866
    4  8E:1F:94:96:DA:FD  iPhone (Анастасия)   866
    5  9A:75:A8:B9:04:1E                  KC   360
    6  4A:EC:1E:DB:BF:95      POCO X5 Pro 5G   360
    7  56:C5:2B:9F:84:90          OnePlus 6T   360
    8  E8:28:C1:DC:B2:41        MIREA_GUESTS   360
    9  E8:28:C1:DC:B2:40       MIREA_HOTSPOT   360
    10 E8:28:C1:DC:B2:42                       360

6.  Отсортировать точки доступа по частоте отправки запросов (beacons) в
    единицу времени по их убыванию

``` r
sorted_beacons_wpa3 <- wpa3 %>% 
  select(ESSID, First.time.seen, Last.time.seen, X..beacons) %>% 
  arrange(desc(X..beacons)) 
sorted_beacons_wpa3 
```

                    ESSID      First.time.seen       Last.time.seen X..beacons
    1  iPhone (Анастасия)  2023-07-28 10:08:32  2023-07-28 10:15:27         12
    2                      2023-07-28 09:52:54  2023-07-28 10:25:02          9
    3  iPhone (Анастасия)  2023-07-28 09:59:20  2023-07-28 10:04:15          9
    4   iPhone XS Max 🦊🐱🦊  2023-07-28 10:27:01  2023-07-28 10:27:10          5
    5                      2023-07-28 09:15:45  2023-07-28 09:33:10          3
    6          Christie’s  2023-07-28 09:41:52  2023-07-28 09:41:52          1
    7                      2023-07-28 11:16:36  2023-07-28 11:16:38          1
    8            Димасик   2023-07-28 10:15:24  2023-07-28 10:15:28          0

## Вывод

Получили знания о методах исследования радиоэлектронной обстановки,
представление о механизмах работы Wi-Fi сетей на канальном и сетевом
уровне модели OSI, закрепили практические навыки использования языка
программирования R для обработки данных и знания о функциях обработки
данных экосистемы tidyverse в R
