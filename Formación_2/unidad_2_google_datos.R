# CURSO GOOGLE

# PIPE/ CANALIZACION: es una herramienta para expresar una secuencia ->
# - > de varias operaciones.
# esta representada por un %>% 
# se usa para aplicar el resultado de una funcion en otra

#  str(). mostrará la estructura de datos
#  list()
#  $ refleja la estructura anidada

library(tidyverse)
library(lubridate)

today()
now()
ymd("2021-01-20")
mdy("January 20th, 2021")
dmy("20-Jan-2021")
ymd(20210120)
ymd_hms("2021-01-20 20:11:59")
mdy_hm("01/20/2021 08:01")

#as_date() para convertir una fecha-hora en una fecha. Por ejemplo, escribe la fecha-hora actual en el paréntesis de la función now(). 
as_date(now())
data.frame(x = c(1, 2, 3) , y = c(1.5, 5.5, 7.5))

# dir.create para crear una nueva carpeta o directorio, o para guardar tus archivos

dir.create ("destination_folder")

#file.create() para crear un archivo en blanco.
file.create (“new_text_file.txt”) 

file.create (“new_word_file.docx”) 

file.create (“new_csv_file.csv”) 

# file.copy() copier un archivo mediante la función 
# agrega el nombre del archivo a copiar. Luego, escribe una coma y 
# agrega el nombre de la carpeta de destino a la que quieres copiar el archivo. 
file.copy (“new_text_file.txt” , “destination_folder”)

# unlink() eliminar archivos de R utilizando la función 
unlink (“some_.file.csv”)

# MATRIX

matrix(c(3:8), nrow = 2)

matrix(c(3:8), ncol = 2)


# operadores logicos
 #AND (algunas veces representado como & o && en R)

 # OR (algunas veces representado como | o || en R)

 # NOT (!)

x <- 10
x > 3 & x < 12

!TRUE

!(Solar.R > 150 | Viento > 10). R aplicará el operador NOT a todo lo que se encuentre entre paréntesis. 

