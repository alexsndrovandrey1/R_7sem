library(dplyr)
data(starwars)
#Задание 1 кол-во строк в датафрейме
n_rows <- starwars %>% nrow()
n_rows
#Задание 2 кол-во столбцов в датафрейме
n_columns <- starwars %>% ncol()
n_columns
#Задание 3 примерный вид датафрейма
dataframe <- starwars %>% glimpse()
dataframe
#Задание 4 уникальные расы
unique_species <- starwars %>%
  select(species) %>%
  distinct() %>%
  nrow()
unique_species
#Задание 5 самый высокий 
tallest_hero <- starwars %>%
  filter(height == max(height, na.rm = TRUE))
cat(tallest_hero$name)
#Задание 6 все ниже 170
short_hero <- starwars %>%
  filter(height < 170)
cat(paste(short_hero$name, "\n"))
#Задание 7 имс всех персов
IMT <- starwars %>%
  mutate(BMI = mass / ((height/100)^2)) %>%
  select(name, BMI)
IMT
#Задание 8 10 самых вытянутых персов
ten_elongated <- starwars %>%
  mutate(elongation = mass / height) %>%
  arrange(desc(elongation)) %>%
  head(10)
ten_elongated
#Задание 9 средний возраст персонажей каждой расы
average_age_each_species <- starwars %>%
  group_by(species) %>%
  summarise(average_age = mean(birth_year, na.rm = TRUE))
average_age_each_species
#Задание 10 самый распр цвет глаз
color_eyes <- starwars %>%
  count(eye_color) %>%
  filter(n == max(n))
color_eyes
#Задание 11 средняя длина имени в каждой расе
average_len_name_each_species <- starwars %>%
  group_by(species) %>%
  summarise(average_name_len = mean(nchar(name)))
average_len_name_each_species


