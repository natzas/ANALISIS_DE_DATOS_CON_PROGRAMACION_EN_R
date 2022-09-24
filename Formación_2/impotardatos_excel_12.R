library(readxl)
####################
#                  #
# Copia todo esto! #
#                  #
####################
# Hecho con gusto por Rafa @GonzalezGouveia

# T2V2 - importar datos de excel a R

# Objetivo: aprender a importar datos de excel a R
# ------------------------------------------------
# En este ejercicio vamos a aprender:
# 1. Que necesitas antes de empezar
# 2. Cómo importar datos utilizando código de R
# 3. Cómo importar datos con la interfaz de RStudio


#####################################
# 1. Que necesitas antes de empezar #
#####################################

# instalar paquete readxl


# cargar paquete readxl


# buscar la ruta del archivo de excel
file.choose()

# Copiar ruta de la consola y guardar en variable
ruta_excel <- "D:\\Users\\NATALIA\\Downloads\\enero-julio.xls"

# como mirar las hojas de tu excel
excel_sheets(ruta_excel)

#####################################
# 2. importar excel con código de R #
#####################################

# importar caso ideal
caso_ideal <- read_excel(ruta_excel)

# importar caso medio. para acceder a datos que no estan el la 1º hoja 
caso_medio <- read_excel(ruta_excel,
                         sheet = "Hoja2") # indicar la hoja 


# importar caso dificil
final_boss <- read_excel(ruta_excel,
                         sheet = "Export",
                         range = "C7:f17")



##########################################
# 3. importar excel con interfaz RStudio #
##########################################

# ir a File > Import Dataset > From Excel...




# fin