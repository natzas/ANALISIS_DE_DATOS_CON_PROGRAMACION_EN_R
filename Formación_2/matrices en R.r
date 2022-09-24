#############################
## -------- MATRIX--------##
#############################

## raulvalerio@gmail.com

###
Y = matrix(1:9,3,3)

nrow(Y)
ncol(Y)
Y

mymat<- matrix(
  c (
    30,	29,	19,	27,	23,
    27, 15, 18, 13, 21,
    21,	14,	14,	8,	20,
    31,	22,	12,	14,	13,
    25,	22,	17,	20,	16,
    9,	8,	26,	23,	20,
    20,	19,	24,	24,	12,
    26, 6,  14, 13, 22,
    29,	28,	22,	23,	27,
    23,	18,	9,	22,	16),10,5) # default by col

mymat   # what are the dimensions?

dim(mymat)  ## how it did it? dimension (fila, columna)

str(mymat) # estructura

mymat[,1] # por columna
mymat[1,] # por fila 

mydata<- as.data.frame(mymat)  # changing to data frame

mydata  # what is the difference??

## lets compare the structure behind
A = matrix( 
     c(2, 4, 3, 1, 5, 7), # the data elements 
     nrow=2,              # number of rows 
     ncol=3,              # number of columns 
     byrow = TRUE)        # fill matrix by rows 

A                      # print the matrix 

dim(A)

x = matrix(1:12) # nocols nor norow  -> one single column

x   # default ncol = 1

x = matrix(1:12, ncol=3, nrow = 4)

dim(x)

nrow(x)

ncol(x)

is.matrix(x)

x

colnames(x) <- c("Age","Poid","Haut") # cambiar nombres columnas

rownames(x) =  c("Pierre","Frank","Quentin","Karl") # cambiar nombre a filas

x[1,]
x[,3]

apply (x, 1, mean)   #3 by row . APPLY SE PASA TODO COMO PANDAS 

apply (x, 2, mean) # by column

apply( x, 1, sum)  

x["Frank",] # acceder por bnombre fila

x[,"Age"] # acceder nombre columna


## let see the structure of mymat matrix ---> see some lines back
# what are the default values?

A[2, 3]      # element at 2nd row, 3rd column

# The entire mth row A can be extracted as A[m, ].

A[2, ]  # the 2nd row

A[ ,3]       # the 3rd column


A[ ,c(1,3)]  # the 1st and 3rd columns 

# possible operations

A^2  #the same than  A*A  ,what is it? . multiplica elemento por elemento

B = matrix( c(2, 4, 3, 1, 5, 7), 2,3)

B
dim(A) == dim(B)

A+B, B+A

A*B  # is it multiplication?   2 x 3   2 x 3  not possible
   --> it's element times element'

C = matrix( c(2, 4, 3, 1, 5, 7), 3,2)
dim(A) == dim(C)
C


C * A  #, why not??  non-conformable arrays

C %*% A #, what is it?    multiplication of matrices
B %*% A

D = C %*% A

dim(D)

det( D) # singular
C
C^T  #,is this what I think? elevada a la T como algebra lineal
A^T

t(C)  # transp . transpuesta, una dimension que cmabia, si tenia 2 columnas ahora sera 2filas y se tenia 3 filas seran 3 columnas

C^-1  #, what have you done?  --> not inverse of the matrix
       # multiplicative inverse of each element

D^-1  # con una matriz cuadrada si lo hace. 1 por cada (entre) elemento

(C %*% A )^-1  #, what is it? . seria lo mismo que D

library(matlib)

inv( C %*% A) 

solve(D)   # base function in R   det D == 0
det(D)

solve( A%*%C)  # no es lo mismo que D # calcula matriz inversa realizada (averiguar)
# calculo la inversa por la matriz original = matriz identidad (en ej 3 3)

det(A%*%C) 

solve( A%*%C) %*% ( A%*%C)   # matriz #??????   A * A^-1  -->   I2



 