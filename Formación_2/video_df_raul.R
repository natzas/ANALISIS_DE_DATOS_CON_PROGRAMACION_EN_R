# DATA FRAME (es un conjunot de tablas para guardar informacion)

n <- c(2,3,5)
s= c("aa", "bb", "cc")
b <- c(TRUE, FALSE, TRUE)

df <- data.frame(n, s, b)
df

typeof(df) # estructura interna

class(df)  # clase

# todos los elementos son vectores
# todos los elementos tienen la misma longitud
# diferentes nombres para las variables

# para convertir otro objeto en dataframe
as.data.frame()

vector2_df <- as.data.frame(vector2)

typeof(vector2_df)
class(vector2_df)
str(vector2_df)

# load dataset


