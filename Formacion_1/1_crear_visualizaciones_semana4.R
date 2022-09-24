# SEMANA 4 
# Elementos básicos de visualización en R y tidyverse
# ggplot2:  estetica, geometicas, facetas, etiquetas, anotaciones

# una estetica en ggplot es una propiedad visual de un objeto de tu diagrama
# la estetica, incluye el tamaño, forma, color

# figura geometrica: objeto geometrico para representar los datos
# los puntos muestran la relacion entre 2 variables cuantitativas
# barras muestan 1 variable cuantitativa que varia entre diferentes categorias
# faceta, permiten mostrar gpos mas pequeños, o subconjuntos de datos,
# -> puede crear diagramas separados para todas las variables en el conjunto de datos
# label y anotaciones: personalizan el diagrama, agregar titulos, subtitulos, leyendas para comunicar

library(ggplot2)
library(palmerpenguins)

# ej: realcion de masa corporal y longitud de aleta (positivo, cto mas grande mas grande la aleta)
ggplot(data = penguins) + geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

# cada diagrama comineza con la funcion ggplot
# 1º ggplot, argumento -> data= data frame
# + -> agregar capas al diagrama
# 2º elegir figura geometrica, argumento -> mapping equals aes, indica que estetica usar
# aes -> define el mapeo ent los datos y el diagrama
# (mapear, empareja una variable especifica en el conunto de datos con una estatica especifica)
# 3º aplicar estitica aes, variable eje x logitud aleta , al eje y masa 
# -> escribir el nombre de la estetica y despues el signo = , luego  l nombre de la variable

# relacion de largo de pico y ancho
ggplot(data = penguins) + 
  geom_point(mapping = aes(x = bill_length_mm, y= bill_depth_mm))

# para saber mas de la funcion
? geom_point
