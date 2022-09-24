####################
#                  #
# Copia todo esto! #
#                  #
####################
# Hecho con gusto por Rafa @GonzalezGouveia

# T2V7 - importar datos csv a R

# Objetivo: aprender a importar archivos csv a R
# ------------------------------------------------
# En este ejercicio vamos a aprender:
# 1. Que necesitas antes de empezar
# 2. Cómo importar datos utilizando código de R
# 3. Cómo importar datos con la interfaz de RStudio


#####################################
# 1. Que necesitas antes de empezar #
#####################################

# instalar paquete readr
# install.packages("readr")

# cargar paquete readr
library(readr)

# buscar la ruta del archivo de csv
file.choose()

# Copiar ruta de la consola y guardar en variable
ruta_csv <- "D:\\Users\\NATALIA\\Downloads\\ds_salaries.csv"

read_csv(ruta_csv)

#####################################
# 2. importar csv con código de R #
#####################################

# importar datos gapminder
salaries <- read_csv(ruta_csv)

# mirar datos
head(salaries)

# caso no titulo
ruta_sintitulo <- "D:\\Users\\NATALIA\\Downloads\\gapminder_col_names.csv"

gapminder_sintitulo <- read_csv(ruta_sintitulo,
                                col_names = FALSE)
                                
# para agregar nombre
gapminder_contitulo <- read_csv(ruta_sintitulo,
                                col_names = c("pais",
                                              "anio",
                                              "vida",
                                              "poblacion"))

# caso punto y coma
ruta_puntoycoma  <- "D:\\Users\\NATALIA\\Downloads\\gapminder_puntoycoma.csv"

gapminder_puntoycoma  <- read_csv2(ruta_puntoycoma)
########################################
# 3. importar csv con interfaz RStudio #
########################################

# ir a File > Import Dataset > From Text (readr)


# código que genera y ejecuta R automáticamente



# fin
