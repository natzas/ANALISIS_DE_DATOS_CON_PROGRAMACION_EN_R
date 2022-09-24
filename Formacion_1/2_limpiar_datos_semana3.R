# LIMPIEZA CON LO BASICO

# PAQUETE HERE
# -> facilita la consulta de los archivos
install.packages("here")
library("here")

# PAQUETE SKIMR
# -> simplifica lastareas de limpieza de datos
# -> facilita mucho el resumen de datos
# -> te permite hojarlos mas rapido
install.packages("skimr")
library("skimr")

# PAQUETE JANITOR
# -> tiene funciones para la limpieza de datos
install.packages("janitor")
library("janitor")

library("dplyr")

install.packages("palmerpenguins") # datos precargados de r

library("palmerpenguins")

# skim without charts, da un resumen completo del dataset
skim_without_charts(penguins)

# glimpse, resumen mas corto del dataset
glimpse(penguins)

# head, muestras pimeras filas
head(penguins)

#select, especificar o excluir ciertos datos. subconjunto de variabls
penguins %>% 
  select(species) # solo trae species

penguins %>% 
  select(-species) # trae todo menos species

# rename, cambia nombre de columnas
penguins %>% 
  rename(island_new= island) # nueva columna = a la columna a cambiar

# rename_with, cambia nombre de columnas mas coherentes
rename_with(penguins, toupper) # pone en mayuscula las columnas 

rename_with(penguins, tolower) # pone en minuscula las columnas

# clean names(janitor), verifica automatocamte que el nombre de las columnas sean exlusivos y coherentes
clean_names(penguins)


# CONVENCIONES DE NOMENCLATURA DE ARCHIVOS

# Nombrar archivos

# -> Mantén los nombres de los archivos con una longitud razonable
# -> Usa guiones bajos y guiones para facilitar la lectura
# -> Empieza o termina el nombre del archivo con una letra o un número
# -> Usa un formato de fecha estándar cuando corresponda; ejemplo: AAAA-MM-DD
# ->Usa nombres de archivos relacionados que funcionen bien con la ordenación predeterminada; por ejemplo: 
  # en orden cronológico o en orden lógico utilizando primero los números
# ejemplo : 2020-04-10_march-attendance.R

# ORGANIZA TUS DATOS

library(tidyverse)

# arrange, elige por cual variable queremos ordenar. cuando ejecute devuelva un tibble con datos
# este ordenamiento solo queda en consola
penguins %>%  arrange(bill_length_mm) # orden ascendente por defecto

penguins %>%  arrange(-bill_length_mm) # para descendiente poner el - 

# para que en el dataframe quede con ese arrange, asignar nuevo el dataframe
penguins2 <- penguins %>%  arrange(-bill_length_mm)

# group by, agrupa datos. suele combinarse con otras funciones
# droup_na, elimina los valores NA
penguins %>% group_by(island) %>% drop_na() %>% summarize(mean_bill_length_mm= mean(bill_length_mm))

# ejemplo para sacar el pinguino con el pico mas largo 
penguins %>% group_by(island) %>% drop_na() %>% summarize(max_bill_length_mm = max(bill_length_mm))

# ej: agrupar por mas columnas, sacar el max y mean
penguins %>% group_by(species, island) %>% drop_na() %>% 
  summarize(max_bl = max(bill_length_mm), mean_bl = mean(bill_length_mm))

# filter, filtrar datos
penguins %>% filter(species == "Adelie")

# TRANSFORMACION DE DATOS

id <- c(1:10)
name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")

job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

employee <- data.frame(id, name, job_title)
print(employee)

# separate,separa datos de una misma columna
# 1º df, 2º columna, 3º en que columna se quieres separar, 4º separe por lo que se indique(espacio blanco o comar, etc)
separate(employee, name, into = c("first_name", "last_name"), sep = " ")
print(employee)

# unite, fusiona columnas entre si

id <- c(1:10)
first_name <- c("John", "Rob", "Rachel", "Christy", "Johnson", "Candace", " Carlson", "Pansy", "Darius", "Claudia")
last_name <- c("Mendes", "Stewart", "Abrahamson", "Hickman", "Harper", "Miller", "Landy", "Jordan", "Berry", "Garcia")
job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")

employee <- data.frame(id, first_name, last_name, job_title)

# 1º df, 2º nombre de columna unida, 3º las columnas a unir, 4º que se separe por lo indicado
unite(employee, "name", first_name, last_name, sep = " ")

# mutate, tambien sirve para agregar columnas con calculos
penguins %>% 
  mutate(body_mass_kg=body_mass_g/1000)

penguins %>% 
  mutate(body_mass_kg=body_mass_g/1000, flipper_length_m=flipper_length_mm/1000)


# DE FORMATO ANCHO A FORMATO LARGO
# -> convertir datos en formato ancho en datos en formato largo o viceversa
library(tidyr)
# función pivot longer (paquete tidyr)
# -> alarga los datos de un marco de datos aumentando el número de filas y disminuyendo el número de columnas. 
empleo <- pivot_longer(data = employee, 
                       cols = c("first_name", "last_name",))

# funcion pivot wider
# -> convertir tus datos para que tengan más columnas y menos filas
empleo_2 <- pivot_wider(data = empleo)
                       
