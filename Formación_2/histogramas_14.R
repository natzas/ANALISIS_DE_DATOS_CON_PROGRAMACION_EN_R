####################
#                  #
# Copia todo esto! #
#                  #
####################
# Hecho con gusto por Rafa @GonzalezGouveia

# T2V5 - histogramas en R

# Objetivo: graficar histogramas en r
# ------------------------------------------------
# En este ejercicio vamos a:
# 1. histogramas con base graphics
# 2. histogramas con ggplot2

# la frecuencia es la cantidad de veces que se repite una cosa
# DISTRIBUCION ES COMO SE REPARTEN ESAS COSAS EN UNA VARIABLE

# cargando los datos
data("mtcars")

# haciendo histograma básico
hist(mtcars$hp)

# editando histograma
hist(mtcars$hp,
     #breaks = 50)
      breaks = seq(50, 350, 50) # de desde hasta. y el 3º elemento es el paso 
      col = "darkgray",
      border = "gray10",
      main = "titulo",
      xlab = "variablex",
      ylab = "conto")

# cargar ggplot2
# install.packages("ggplot2")
library(ggplot2)

# hacer un histograma en ggplot2
ggplot(data = mtcars,
       mapping = aes(x = hp)) +
  geom_histogram(bins = 9)


# haciendo más cosas interesantes
ggplot(data = mtcars,
       mapping = aes(x = hp,
                     fill = factor(vs))) +
  geom_histogram(bins = 9,
                 position = "identity",
                 alpha = 0.8) + 
  labs(title = "titulo",
       fill = "vs motor",
       x = "caballos de fuerza",
       y = "conteos",
       subtitle = "subtitulo",
       caption = "fuentes de los datos: R")
# fin