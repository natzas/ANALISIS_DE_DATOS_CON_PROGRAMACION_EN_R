# Mejoras a visualizaciones en R

library(ggplot2)
library(palmerpenguins)

ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g))


# agregar color sobbre una variable
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, color= species))

# dar diferentes formas a una varible
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, shape= species))

# dar diferentes formas y color a una varible
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, shape= species, color= species))

# agregar tamaño a una variable
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, shape= species, color= species, size= species))

# poner transparencia a los puntos o variable
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, alpha= species))

# fijar la estetica por separado a una variable especifica
# modificar la apariencia en gral sin tener en cuenta variables, ->
# -> escribir el codigo fuera de la funcion aes
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g), color= "purple")


# HACER MAS COSAS CON GGPLOT
# objeto geometrico para representar los datos
# Las figuras geometricas: 
# -> geom_point : usa puntos de dispersion
# -> geom_bar: graficos de barra
# -> geom_line: usa lineas
# etc

# geom_smooth: util para tendencias generales
ggplot(data = penguins) +
  geom_smooth(mapping = aes(x = flipper_length_mm, y= body_mass_g))

# se puede usar 2 figuras geometricas en mismo diagrama
# mostrar la relacion entre linea y puntos de datos con mayor claridad
ggplot(data = penguins) +
  geom_smooth(mapping = aes(x = flipper_length_mm, y= body_mass_g)) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g))

# modelar una linea separada p/c espacie, con linetype

ggplot(data = penguins) +
  geom_smooth(mapping = aes(x = flipper_length_mm, y= body_mass_g, linetype= species))

# geom_jitter : crea un diagrama de dispersion y agrega una pequeña cantidad de
# ruido aleatorio a cada punto del diagrama. ayuda a lidiar con el trazo excesivo
# que suceden cuando los puntos de datos en un diagrama se superponen unos con otros
# hace que los puntos sean mas faciles de encontrar

ggplot(data = penguins) +
  geom_jitter(mapping = aes(x = flipper_length_mm, y= body_mass_g))

# Graficos de barra
# cuando se usa bar, R cuenta cuantas veces aparece c/valor de x, muestra en "y" el recuento 
# la opcion predetermina es contar filas
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

# agregar color al contorno de las barras
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, color= cut))

# agrega color dentro de la barra con fill
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill= cut))

# aplicar color a otra variable
# grafico de barras apiladas
# ej muestra 40 combinaciones de diferentes cortes y claridad
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill= clarity))

# SAUVIZADO
# permite detectar una tendencia de datos aun cuando no puedes notar-
# -> con facilidad una tendencia en los puntos de datos graficados
# es útil porque suma una línea de suavizado como otra capa en un diagrama

# hay 2 tipos:
# Loess: es para suavizar diagramas con menos de 1000 ptos
ggplot(data, aes(x=, y=))+ 
  geom_point() +       
  geom_smooth(method="loess")

# Gam o suavizado con modelos aditivos generalizados: para un gran numeros de ptos
ggplot(data, aes(x=, y=)) + 
  geom_point() +        
  geom_smooth(method="gam", 
              formula = y ~s(x))

# ESTETICAS Y FACETAS

# funcion faceta: deja mostrar gpos mas pequeños o subconjuntos
# es una cara o seccion de un objeto
# ayuda a decubrir nuevos patrones y relaciones entre diferentes variables

# hay 2 tipos:

# facet_wrap(): para una 1 variable, crea un diagrama sparado p/c especie
ggplot(data = penguins, aes(x = flipper_length_mm, y= body_mass_g)) +
  geom_point(aes(color= species)) +
  facet_wrap(~species)

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = color, fill= cut)) +
  facet_wrap(~cut)


# facet_grid: para 2 variables, separa el diagrama en facetas verticalmte segun los-
# -> valores de la 1º variable. y horizontalmte segun valores de 2º variable
# permite reorganizar y mostrar con rapidez datos complejos. y ver relaciones entre direfente gpos
# revelar patrones y tendencias en subcojuntos
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, color= species)) +
  facet_grid(sex~species)

ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, color= species)) +
  facet_grid(~species)

ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, color= species)) +
  facet_grid(~sex)

# Ejemplo de filtrado de datos para el trazado
# permite enfocarte en subconjuntos específicos de tus datos
# ej:
data %>%
  filter(variable1 == "DS") %>%  
  ggplot(aes(x = weight, y = variable2, colour = variable1)) +  
  geom_point(alpha = 0.3,  position = position_jitter()) + stat_smooth(method = "lm")

