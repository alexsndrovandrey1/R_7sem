# Подготовка данных
library(dplyr)
library(jsonlite)
library(tidyr)
library(xml2)
library(rvest)
#Импорт данных
data = stream_in(file('caldera_attack_evals_round1_day1_2019-10-20201108.json'))

#"Аккуратные данные"
neat_data <- data %>%
  mutate(`@timestamp` = as.POSIXct(`@timestamp`, format = "%Y-%m-%dT%H:%M:%OSZ", tz = "UTC")) %>%
  rename(timestamp = `@timestamp`, metadata = `@metadata`)

#Общая структура
glimpse(neat_data)

#Анализ
#Задание 1
data <- neat_data %>%
  tidyr::unnest(c(metadata, event, log, winlog, ecs, host, agent), names_sep = ".")
data

#Задание 2
data_minimized  <- data %>%
  select(-metadata.beat, -metadata.type, -metadata.version, -metadata.topic,
         -event.kind, -winlog.api, -agent.ephemeral_id, -agent.hostname, 
         -agent.id, -agent.version, -agent.type) %>%
  mutate(`event.created` = as.POSIXct(`event.created`, format = "%Y-%m-%dT%H:%M:%OSZ", tz = "UTC"))
data_minimized

#Задание 3
data_minimized %>%
  distinct(host.name)

#Задание 4
web_url <- "https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/plan/appendix-l--events-to-monitor"
web <- xml2::read_html(web_url)
event <- rvest::html_table(web)[[1]]
event

event_data <- event %>%
  mutate_at(vars(`Current Windows Event ID`, `Legacy Windows Event ID`), as.integer) %>%
  rename(c(Current_Windows_Event_ID = `Current Windows Event ID`, 
           Legacy_Windows_Event_ID = `Legacy Windows Event ID`, 
           Potential_Criticality = `Potential Criticality`, 
           Event_Summary = `Event Summary`))
event_data

#Задание 5
event_data %>%
  count(Potential_Criticality) %>%
  arrange(desc(n))