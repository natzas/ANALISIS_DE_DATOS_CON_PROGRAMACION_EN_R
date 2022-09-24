# datos titanic

library(tidyverse) # para anilzar datos

# cargar datos
library(titanic)
data("titanic_train")
head(titanic_train)

# librerias p/clasificacion
library(rpart) # hace calculos
library(rattle) # dar forma a la grafica
library(rpart.plot) # dar forma a la grafica

# modelando con arbol de decision
arbol <- rpart(
  formula = Survived ~ Sex + Age, # el dato a predecir va primero, luego las variables que se quieren 
  data = titanic_train,  # donde toma los datos
  method = "class"  # prediga sobre la clase
)

# graficar arbol
fancyRpartPlot(arbol) # se pasa el arbol

# prediciendo con el arbol
pred_arbol <- predict(arbol, type = "class") # para clasificar, type calcula sobre los datos
titanic_pred <- cbind(titanic_train, pred_arbol)# crear un df que contanga los datos con su prediccion
               #cbin es para combinar estructuras de datos x columna que tenga la misma cantidad de filas 

# pasajero male de 4 años sobrevive o no
predict(object = arbol,
        newdata = data.frame(Age = 4,
                             Sex = "male"),
        type = "class") 

# se crea objeto llamando al arbol
# un nuevo dato , designando un fd con las variables 
# type, para que calcule lo indicado

