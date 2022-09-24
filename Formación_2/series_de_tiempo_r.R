# SERIES DE TIEMPO
# el objetivo es pronosticar
# - cantidades a futuro
# - se basa en el pasado
# - generar un modelo estadistico


# cuantos usuarios por hora?
# trabajar por fechas
# ultima semana febrero
# conteos por horas

library(tidyverse)
library(lubridate)

raw_data <- read_csv("D:\\Users\\NATALIA\\Downloads\\2020-02.csv")

head(raw_data)

# procesamiento de datos
viajes_diarios <- raw_data %>%  # se asigna una variable y se concatena
  mutate(fecha_hora = dmy_hms(paste(Fecha_Retiro, Hora_Retiro))) %>%  # muta crea una variable para dejar 1 o mas datos en a variable
                     # toma el dato y lo acomoda
                     # paste, concatena los datos
  filter(fecha_hora >= as.Date("2020-02-24"), # filtre datos mayo que la fecha indicada
         fecha_hora <= as.Date("2020-02-27")) 
                      # as convierte el str de la fecha en formato fecha
