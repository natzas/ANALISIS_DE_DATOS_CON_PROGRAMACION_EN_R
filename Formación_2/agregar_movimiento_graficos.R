library(tidyverse)
library(gganimate)
library(gifski)
library(gapminder)

#cargar datos
data("gapminder")

# cargando datos en entorno
head(gapminder)

# grafica 1
gapminder %>% 
  group_by(year,continent) %>% 
  summarize(mean_life= mean(lifeExp)) %>% 
  ggplot(aes(x = year,
             y = mean_life,
             color = continent)) +
  geom_line()

# animacion grafica
gapminder %>% 
  group_by(year,continent) %>% 
  summarize(mean_life= mean(lifeExp)) %>% 
  ggplot(aes(x = year,
             y = mean_life,
             color = continent)) +
  geom_line() +
  transition_reveal(year)

# mejorar animacion
gapminder %>% 
  group_by(year,continent) %>% 
  summarize(mean_life= mean(lifeExp)) %>% 
  ggplot(aes(x = year,
             y = mean_life,
             color = continent)) +
  geom_line(size = 2) +
  geom_point(size = 4) +
  labs(title = "esperanza de vida en {frame_along}", # para que el año se mueva va en {}
       x = "Fecha",
       y = "Años de vida") + 
  theme_minimal() +
  transition_reveal(year)

