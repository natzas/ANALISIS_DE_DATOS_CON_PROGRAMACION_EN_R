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
  mutate(fecha_hora = dmy_hms(paste(Fecha_Retiro, Hora_Retiro))) %>%  # muta crea una variable para dejar 1 o mas datos en a variable # toma el dato y lo acomoda  # paste, concatena los datos 
  filter(fecha_hora >= as.Date("2020-02-24"), # filtre datos mayo que la fecha indicada
         fecha_hora <= as.Date("2020-02-27")) %>%  # as convierte el str de la fecha en formato fecha
  group_by(horas = floor_date(fecha_hora, unit = "hour")) %>%  #floor asar parametros para tomar a la hora 
  summarise(conteo = n()) # n cuenta cuantos registros hay por hora
  
# rellenando los ceros en los datos
horas_completas <- data.frame(      # se hace df para determinar los datos de horas
  horas = seq(
    floor_date(min(viajes_diarios$horas), unit = "hour"),
    floor_date(max(viajes_diarios$horas), unit = "hour"),
    by = "hour"
))

# left join con horas (agregar los ceros)
viajes_hora <- horas_completas %>% 
  group_by(horas_redondeadas = floor_date(horas, unit = "hour")) %>% 
  left_join(viajes_diarios) %>% 
  mutate(conteo = ifelse(is.na(conteo), 0, conteo)) # ifelse toma una condicion y verifica si se cumple una condicion le asigna un valor sino le da otro
                        # si no hay match en la hora coloca 0 en el conteo si no el valor 

# grafica de lineas inicial
ggplot(data = viajes_diarios,
       aes(x = horas,
           y = viajes_diarios$conteo)) +
  geom_line()

# autoregresivo integrado de media movil estacional- MODELO SARIMA
# AR: "regresion sobre si mismo
# I: diferencias
# MA: tiene que ver con los "errorres"
# S: fenomenos que s repiten
# parametros (p,d,q)(ps,ds,qs)[S]

# creando obejto ts para modelo
conteo_ts <- ts(viajes_hora$conteo,
                start = 1,
                frequency = 24)

library(forecast) # para hacer series de tiempo

# haciendo el modelo
ajuste <- auto.arima(y = conteo_ts) # auto.arima calcula todos os parametros de arima

summary(ajuste)

predicciones <- forecast(ajuste) # prevision

min(predicciones[["lower"]])
max(predicciones[["upper"]])

p_predict <- autoplot(predicciones) # calucla las bandas de confianza
p_predict

# graficando toda la semana

# procesamiento de datos
viajes_diarios <- raw_data %>%  # se asigna una variable y se concatena
  mutate(fecha_hora = dmy_hms(paste(Fecha_Retiro, Hora_Retiro))) %>%  # muta crea una variable para dejar 1 o mas datos en a variable # toma el dato y lo acomoda  # paste, concatena los datos 
  filter(fecha_hora >= as.Date("2020-02-24"), # filtre datos mayo que la fecha indicada
         fecha_hora <= as.Date("2020-02-29")) %>%  # as convierte el str de la fecha en formato fecha
  group_by(horas = floor_date(fecha_hora, unit = "hour")) %>%  #floor asar parametros para tomar a la hora 
  summarise(conteo = n()) # n cuenta cuantos registros hay por hora

# rellenando los ceros en los datos
horas_completas <- data.frame(      # se hace df para determinar los datos de horas
  horas = seq(
    floor_date(min(viajes_diarios$horas), unit = "hour"),
    floor_date(max(viajes_diarios$horas), unit = "hour"),
    by = "hour"
  ))

# left join con horas (agregar los ceros)
viajes_hora <- horas_completas %>% 
  group_by(horas_redondeadas = floor_date(horas, unit = "hour")) %>% 
  left_join(viajes_diarios) %>% 
  mutate(conteo = ifelse(is.na(conteo), 0, conteo)) # ifelse toma una condicion y verifica si se cumple una condicion le asigna un valor sino le da otro
# si no hay match en la hora coloca 0 en el conteo si no el valor 

# grafica de lineas inicial
ggplot(data = viajes_diarios,
       aes(x = horas,
           y = viajes_diarios$conteo)) +
  geom_line() +
  ylim(-551.5396, 4103.783) +  # limites superior e inferior para que la grafica tenga el mismas dimensiones en eje y
  labs(title = "Realidad")
