# ARRAY

# this is an extension of matrices, multiple dimensiones 
my.array <- array(1:24, dim = c(3,4,2)) # el 2 indica la pag o como separa
my.array
dim(my.array)

# vector to array
my.vector<- 1:24
my.vector
is.vector(my.vector)
dim(my.vector) <- c(3,4,2) # changing dimensiones
my.vector

is.vector(my.vector) # los vecotores no tienen dimensiones
is.array(my.vector)
dim(my.vector)

# crear dos vectores de diferentes longitud
vector1 <- c(5,9,3)
vector2 <- c(10,11,12,13,14,15)

# take these vectors as input the array/ tomar estos vectores como entrada el array
resultado <- array(c(vector1, vector2), dim = c(3,3,2)) # va rellenado por columna
resultado  # al solo tener 9 valores, r rellena la segunda page con los mismo valores

str(resultado) # estructura

length(resultado) # longitud

column.names <- c("col1","col2", "col3") # para nombrar se usa columnnames
row.names <- c("row1","row2", "row3")
matrix.names <- c("matrix1","matrix2")

# tomar estos vectores como entrada el array
resultado <- array(c(vector1, vector2), dim = c(3,3,2), dimnames = list(row.names,      # con dimnames renombre la estructura con las variables creadas  
                                                                        column.names, matrix.names))
resultado

resultado[3,,2] # acceder elemento. ej 3 fila, , 2 matriz
resultado[1,3,1] # 1 fila, 3 columna, 1 matriz
resultado[,,2] # ultima matriz
resultado[3,,] # 3 fila de todas las dimenciones

# crear dos vectores de fiferente longitud
vector3 <- c(5,9,3)
vector4 <- c(10,11,12,13,14,15,16)

array(c(vector3, vector4)) # en este caso al no especificar dim, crea una sola columna
array(c(vector3, vector4), dim = c(2,2,4)) # filled by columns as matrix /llenado por columnas como matriz


