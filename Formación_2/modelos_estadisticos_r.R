# resolver problemas de machine learning
# Prediccion, Clasificacion, Clustering

# Modelos
# Prediccion: Regresion lineal, multiple, no lineal
# Clasificacion: Arboles de decision, KNN, Regresion logistica
# Clustering: K-medias o K-means, clustering jerarquico o analisi de conglomerado

# cual sera la medidade un arbol de naranja a los 800 dias de sembrado?
# medida = a*dias + b (a = pendiente o slope, b = intercepto)

library(tidyverse)

# cargar datos
data("Orange")

head(Orange)

# grafica
Orange %>% 
  ggplot(aes(x = age,
             y = circumference)) + 
  geom_point()+
  geom_abline(intercept = 10,
              slope = 0.1,
              col = "blue")

# mejor ajuste de regresion lineal simple
lm(circumference ~ age, data = Orange)

Orange %>% 
  ggplot(aes(x = age,
             y = circumference)) + 
  geom_point()+
  geom_abline(intercept = 17.3997,
              slope = 0.1068,
              col = "blue") +
  geom_vline(xintercept = 800,
             col = "red")

# valor exacto
dias <- 800
medida <- 0.1068 * dias + 17.3997
print(medida)
