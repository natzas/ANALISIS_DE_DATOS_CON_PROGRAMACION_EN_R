# OBSERVAR LOS DATOS CON MAS DETALLES

install.packages("Tmisc")
library(Tmisc)
library(dplyr)
library(ggplot2)

# cuarteto anscombe, tiene 4 conjunto de datos, con estadisticas de resumen casi identicas
data(quartet)
View(quartet)

# resumen de mediciones estadisicas del data
# sd (desviacion estandar). cor(correlacion)
quartet %>% 
  group_by(set) %>% 
  summarize(mean(x), sd(x), mean(y), sd(y), cor(x,y)) # cor muestra la solidez en relacion entre 2 variables

# grafico para ver la diferencia entre los datos
ggplot(quartet, aes(x,y)) + geom_point() + geom_smooth(method= lm, se=FALSE) + facet_wrap(~set)


# PAQUETE datasauRus
# -> crea diagramas con datos de Anscombe en diferentes formas
install.packages("datasauRus")
library("datasauRus")

# graficos con formas
ggplot(datasaurus_dozen, aes(x=x, y=y, colour= dataset)) + geom_point() + 
  theme_void() + theme(legend.position = "none") + facet_wrap(~dataset, ncol = 3)


# FUNCION DE SESGO

# funcion bias
# -> calcula el monto promedio en que el resultado real supera al resultado previsto
# -> esta incluido en el paquete de diseño Sim

# - si el modelo no tiene sesgo, el resultado deberia ser bastante cercano a cero
# - un resultado alto significa que los datos podrian estar sesgados
# - algo que es bueno saer antes de analizarlos

install.packages("SimDesign")
library(SimDesign)

# ej: comparar las temperaturas pronosticadas con las temperaturas reales
actual_temp <- c(68.3, 70, 72.4, 71, 67, 70)
predicted_temp <- c(67.9, 69, 71.5, 70, 67, 69)

bias(actual_temp, predicted_temp)

# ej: registro de cuantas copias de juegos nuevos venden en la fecha de lanzamiento,
# comparar cifras con sus ventas reales p/saber si los pedidos de stock
# coiciden consus necesidades reales

actual_sales <- c(150, 203, 137, 247, 116, 287)
predicted_sales <- c(200, 300, 150, 250, 150, 300) # stock

bias(actual_sales, predicted_sales)
# el resultado demuestra que tal vez pide demasiado stock para el lanzamiento


# FUNCION SAMPLE
# -> permite tomar una muestra aleatoria de elementos de un conjunto de datos

#  ejemplo de sesgo en eleccion de anuncios(lectura)


# Recursos:
# https://www.rdocumentation.org/packages/SimDesign/versions/2.2/topics/bias
# 
# Glosario:
# https://docs.google.com/document/d/1927KUgpvDzy9YoQqhTqLBAJYD7HAYFmfp75B3HrvKII/template/preview

