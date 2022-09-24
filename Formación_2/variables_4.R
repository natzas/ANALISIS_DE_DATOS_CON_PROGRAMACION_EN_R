####################
#                  #
# Copiar todo esto #
#                  #
####################
# Hecho con gusto por Rafa @GonzalezGouveia

# video 04 – variables

# Objetivo: estudiar qué es una variable en R.
# ——————————————–
# En este ejercicio vamos a:
# 1. Realizar operaciones aritméticas en la consola
# 2. Asignar variables a un script en RStudio, y 
# 3. Identificar distintos tipos de datos en R

#######################################
# practica 1: operaciones aritmeticas #
#######################################

# primer acertijo de redes sociales
1+1-1*(1+1-1)/1+1*(-1)

#######################################
# practica 2: asignación de variables #
#######################################

# asigna los numeros a cada fruta
mango <- 10
manzana <- 5
palta <- 15

# resuelve el complejo acertijo
resultado <- 2*palta + 4*manzana + 1.5*mango

# imprime el resultado por pantalla
resultado

##################################
# practica 3: tipos de variables #
##################################

# observa la clase del resultado

class(resultado)
# crea una variable con algún nombre
nombre <- "Natalia"

# observa la clase del nombre
class(nombre)

# es 1 mayor que 2
1 > 2

# cual es la clase de esto
class(1 > 2)

# suma nombre con resultado
nombre + resultado