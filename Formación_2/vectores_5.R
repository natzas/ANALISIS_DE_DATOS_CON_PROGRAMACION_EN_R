# ##################
#                   #
# Copiar todo esto #
#                   #
# ##################
#Hecho con gusto por Rafa @GonzalezGouveia

# video 05 - vectores

# Objetivo: estudiar qué es un vector en R.
# --------------------------------------------
# En este ejercicio vamos a:
# 1. Crear vectores en un script
# 2. Realizar operaciones aritméticas con vectores
# 3. Seleccionar elementos en un vector


# ##################################
# práctica 1: crear vectores en R #
# ##################################

# crear vector personaje con nombre de las peliculas
nombre <- c("Shrek", "Shrek2", "Shrek Tercero", "Shrek, Felices por siempre")

# crear vector numérico con puntuación de las películas
puntuacion <- c(7.9, 7.2, 6.1, 6.3)

# crear vector lógico sobre si la película es posterior a 2015
posterior_2005 <- c(FALSE, FALSE, TRUE, TRUE)

# ############################################# ##
# práctica 2: operaciones aritméticas con vectores #
# ############################################# ##

# sumar 2 a la puntuación
puntuacion + 2

# dividir la puntuación entre 2
puntuacion/2

# crea la puntuación de rafa
puntacion_1 <- c(10, 9, 6, 7)

# calculo diferencia entre presion
puntacion_1 - puntuacion

# calcular la longitud del vector
length(puntuacion)

# calcular el promedio del vector de puntuación
mean(puntuacion)

# ############################################# #
# práctica 3: selección de elementos de un vector #
# ############################################# #

# # selección basada en posición
# seleccionar la tercera pelicula
nombre[3]

# seleccione la primera y la última película
nombre[c(1, 4)]

# # selección basada en condición lógica
# crear condición lógica
puntuacion_baja <- puntuacion < 7

# mostrar condición para ver VERDADERO/FALSO
puntuacion[puntuacion_baja]

# mostrar energias bajas(aca se puede traer por nombre)
nombre[puntuacion_baja]

# mostrar nombres de películas con bases bajas