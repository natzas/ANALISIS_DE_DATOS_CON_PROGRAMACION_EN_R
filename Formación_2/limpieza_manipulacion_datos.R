library(readxl)
enero_julio_1_ <- read_excel("enero-julio (1).xlsx")

# enero_julio_1_ <- read_excel("enero-julio (1).xlsx",
                            # sheet = "Export", skip = 13)

x <- 1 +2*(1:14) # arma una secuencia de impares
x

eliminar_column <- enero_julio_1_[, -c(x)] # eliminar columnas. se indica la columna
eliminar_column

names(eliminar_column) <- c("HC", "N Protocolo") # renombrar todas las columnas

elimnar_filas <- enero_julio_1_[-c(1:4),] # eliminar filas. se indica que filas y despuesde va la coma que es para columnas

eliminar_column$`MEDICO_VC.-(TRANSFIERE)` == "Fernández Peri, Natalia" # verifco si el dato esta asi en el df true o false

eliminar_column$`MEDICO_VC.-(TRANSFIERE)`[eliminar_column$`MEDICO_VC.-(TRANSFIERE)` == "Fernández Peri, Natalia"] # con la variable le pido solo ese valor

eliminar_column[eliminar_column$`MEDICO_VC.-(TRANSFIERE)` == "Fernández Peri, Natalia",] # trae todas las observaciones sobre el dato en el df

eliminar_column$`MEDICO_VC.-(TRANSFIERE)`[eliminar_column$`MEDICO_VC.-(TRANSFIERE)` == "Fernández Peri, Natalia"] <- "Natalia, Fernadez Peri" # renombrar una observacion o valor

# cambiar a Null sobre columna
eliminar_column$`BIOLOGO_1_VC.-(TRANSFIERE)`[eliminar_column$`BIOLOGO_1_VC.-(TRANSFIERE)` == ":"] <- NA # ?? como elimino null

# cambiar a Null sobre todo el df
eliminar_column$`BIOLOGO_1_VC.-(TRANSFIERE)`[eliminar_column$`BIOLOGO_1_VC.-(TRANSFIERE)` == ":"] <- NA

eliminar_column[,-2] = round(apply(eliminar_column[,-2], 1) # para redondear por columna
                             
                             
eliminar_column[,-2] = round(apply(eliminar_column[,-2], as.numeric), 1) # redondear todo ls datos
### veirficar la formula ###


