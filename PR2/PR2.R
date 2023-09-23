library(dplyr)
data(starwars)
#Задание 1 кол-во строк в датафрейме
n_rows <- starwars %>% nrow()
print(n_rows)
#Задание 2 кол-во столбцов в датафрейме
n_columns <- starwars %>% ncol()
print(n_columns)
#Задание 3 примерный вид датафрейма
dataframe <- starwars %>% glimpse()
print(dataframe)
#Задание 4 уникальные расы
unique_species <- starwars %>%
  select(species) %>%
  distinct() %>%
  nrow()
print(unique_species)
#Задание 5 самый высокий 
tallest_hero <- starwars %>%
  filter(height == max(height, na.rm = TRUE))
print(tallest_hero)
#Задание 6 все ниже 170
short_hero <- starwars %>%
  filter(height < 170)
print(short_hero)
#Задание 7 имс всех персов
IMT <- starwars %>%
  mutate(BMI = mass / ((height/100)^2))
print(IMT)
#Задание 8 10 самых вытянутых персов
ten_elongated <- starwars %>%
  mutate(elongation = mass / height) %>%
  arrange(desc(elongation)) %>%
  head(10)
print(ten_elongated)
#Задание 9 средний возраст персонажей каждой расы
average_age_each_species <- starwars %>%
  group_by(species) %>%
  summarise(average_age = mean(birth_year, na.rm = TRUE))
print(average_age_each_species)
#Задание 10 самый распр цвет глаз
color_eyes <- starwars %>%
  count(eye_color) %>%
  filter(n == max(n))
print(color_eyes)
#Задание 11 средняя длина имени в каждой расе
average_len_name_each_species <- starwars %>%
  group_by(species) %>%
  summarise(average_name_len = mean(nchar(name)))
print(average_len_name_each_species)

      



