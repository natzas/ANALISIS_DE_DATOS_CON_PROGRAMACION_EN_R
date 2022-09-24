# SEMANA 3 

# DATA FRAME

# Data frame: conjunto de columnas. columna tiene una variable;
# filas tienen un conjunto de valores
# pueden ser diferentes de tipos de datos
# cada columna debe contener el mismo numero de elementos de datos
 

# Tibbles -> son como data frame de datos optimizados
#         -> El paquete tibble forma parte del núcleo de tidyverse
#         -> nunca cambian los tipos de datos de las entradas
#         -> nunca cambian los nombres de las variables, 
#         -> nunca crean nombres de filas
#         -> facilitan la impresion en R

# Es una forma de estandarizar la organizacion de los datos en R
# Estandares -> las variables se organizan en columnas
#            -> las observaciones se organizan en filas 
#            -> cada valor debe tener su propia celda

library(ggplot2)
data("diamonds")
View(diamonds)

head(diamonds) # muestra las 6 primeras filas
str(diamonds) # ver estructura de df
colnames(diamonds) # ver nombre de columnas

library(tidyverse)
# es del paquete dplyr 
# mutate para hacer cambios df. 1º dataframe, 2º agregar columna con el nombre y el valor
mutate(diamonds, carat_2= carat*100) 
                                    

glimpse(diamonds) # resumen de cada columna en tus datos organizados horizontalmente

# Ejercicio 1 
# 1º crea un vector de nombres insertando cuatro nombres en este bloque de cÃ³digo entre las comillas y, luego, ejecÃºtalo:
  
names <- c("Susana", "Ruben", "Federico", "Lorena")


# 2º crea un vector de edades agregando cuatro edades separadas por comas al bloque de cÃ³digo que aparece debajo.  

age <- c(10, 50, 25, 45 )

# 3º Con estos dos vectores, puedes crear un nuevo marco de datos llamado `people`:
  
people <- data.frame(names, age)


# Creación de tibbles 
#   -> tibble solo devuelve las 10 primeras filas en una tabla bien organizada
#   -> más fácil para ver e imprimir

library(tidyverse)
data(diamonds)

# función as_tibble() crea un tibble a partir del mismo conjunto de datos
as_tibble(diamonds) 

# Recursos: https://tibble.tidyverse.org/   https://rstudio-education.github.io/tidyverse-cookbook/tidy.html


# CONCEPTOS BASICOS DE IMPORTACION DE DATOS
 
# La función data() para cargar estos conjuntos de datos en R

# sin un argumento, R mostrará una lista de los conjuntos precargados
data() 

# cargar un conjunto pregargado solo ponerlo en parentesis
data("mtcars") 

# una vista previa, escribir su nombre en  consola y presionar ctrl y la tecla Enter
mtcars 

# PAQUETE READR
# -> El paquete readr en R es una herramienta para leer datos rectangulares.
# -> readr forma parte del núcleo de tidyverse

# datos rectangulares:
#  -> son datos que encajan perfectamente en un rectángulo de filas y columnas, 
#  -> en el que cada columna se refiere a una única variable y cada fila a una única observación. 

# ejemplos : 
#  -> .csv (valores separados por comas): archivo de texto
#  -> .tsv (valores separados por tabulaciones): base de datos o hoja de calculo
#  -> .fwf (archivos de ancho fijo): formato específico que permite guardar datos textuales de forma organizada
#  -> .log: generado por computadora que registra eventos de sistemas operativos y otros programas de software

# Funciones readr
# funciones read_ . Cada función se refiere a un formato específico de archivo.
# read_csv(): Archivos de valores separados por comas (.csv)

read_tsv(): Archivos de valores separados por tabuladores

read_delim(): Archivos delimitados en general

read_fwf(): Archivos de ancho fijo

read_table(): Archivos tabulares cuyas columnas están separadas por espacios en blanco

read_log(): Archivos de registro de la web

# readr viene con algunos archivos de muestra, ejecutar
readr_example()

#  indica la ruta del archivo
readr_example("mtcars.csv")


(readrread_csv_example("mtcars.csv"))


# PAQUETE READXL
# -> facilita la transferencia de datos de Excel ( .xls, .xlsx )
# ->  readxl forma parte de tidyverse, es necesario cargar readxl CON library

library(readxl)
# idem al readr

readxl_example()

read_excel(readxl_example("type-me.xlsx"))

# función excel_sheets() para listar los nombres de las hojas individuales. 
excel_sheets(readxl_example())

#  especificar una hoja por nombre o número “sheet =”
read_excel(readxl_example("type-me.xlsx"), sheet = "numeric_coercion")

# Recursos: https://r4ds.had.co.nz/data-import.html

# Tambien para conocer la ruta
file.choose()

