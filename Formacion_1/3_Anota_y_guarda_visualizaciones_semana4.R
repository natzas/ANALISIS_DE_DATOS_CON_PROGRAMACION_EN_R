# ANOTA Y GUARDA VISUALIZACIONES

# LABEL Y ANOTACIONES

# LABEL: informativas
# titles
# subtitles
# captions(leyenda)

library(ggplot2)
library(palmerpenguins)

# Title
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, color= species)) +
  labs(title = "Palmer penguins: body mass vs. flipper length")

# Subtitle (siempre poner coma)
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, color= species)) +
  labs(title = "Palmer penguins: body mass vs. flipper length", subtitle = "Sample of three penguins species")

# Captions: permite mostrar la fuente de los datos
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, color= species)) +
  labs(title = "Palmer penguins: body mass vs. flipper length", subtitle = "Sample of three penguins species",
       caption = "Data collectedby Dr. Kristen Gorman")

# FUNCION ANNOTATE
# coloca texto dentro de la caudricula para destacar ptos de datos especificos
# argumentos: 1º informacion sobre el tipo de etiqueta. 2º ubicacion especifica. 3º contexto de label
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, color= species)) +
  labs(title = "Palmer penguins: body mass vs. flipper length", subtitle = "Sample of three penguins species",
       caption = "Data collectedby Dr. Kristen Gorman") +
  annotate("text", x=220, y=3500, label= "The Gentoos a the largest")

# poner color a la anotacion
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, color= species)) +
  labs(title = "Palmer penguins: body mass vs. flipper length", subtitle = "Sample of three penguins species",
       caption = "Data collectedby Dr. Kristen Gorman") +
  annotate("text", x=220, y=3500, label= "The Gentoos a the largest", color= "purple")

# estilo de fuente y tamaño texto
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, color= species)) +
  labs(title = "Palmer penguins: body mass vs. flipper length", subtitle = "Sample of three penguins species",
       caption = "Data collectedby Dr. Kristen Gorman") +
  annotate("text", x=220, y=3500, label= "The Gentoos a the largest", color= "purple",
           fontface= "bold", size= 4.5)

# cambiar el angulo
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, color= species)) +
  labs(title = "Palmer penguins: body mass vs. flipper length", subtitle = "Sample of three penguins species",
       caption = "Data collectedby Dr. Kristen Gorman") +
  annotate("text", x=220, y=3500, label= "The Gentoos a the largest", color= "purple",
           fontface= "bold", size= 4.5, angle= 25)

# guardar en una variable el grafico
graf_p <- ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, color= species)) +
  labs(title = "Palmer penguins: body mass vs. flipper length", subtitle = "Sample of three penguins species",
       caption = "Data collectedby Dr. Kristen Gorman")

graf_p + annotate("text", x=220, y=3500, label= "The Gentoos a the largest", color= "purple",
                  fontface= "bold", size= 4.5, angle= 25)


# GUARDA VISUALIZACIONES 
# hay 2 tipos:

# Opcion Exportar(se encuentra pestaña diagrama)
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y= body_mass_g, color= species))

# Funcion ggsave: guarda un diagrama. predetminado guarda el ultimo diagrama que se mostro y usa el tamaño
# argumento: 1º nombre del grafico. 2º la extension

ggsave("Three penguin species.png")

# Guardar sin ggsave y exportar
png(file = "exampleplot.png", bg = "transparent")
plot(1:10)
rect(1, 5, 3, 7, col = "white")
dev.off()

pdf(file = "/Users/NATALIA/Desktop/Lenguaje_R/example.pdf",    
    width = 4,     
    height = 4) 
plot(x = 1:10,     
     y = 1:10)
abline(v = 0)
text(x = 0, y = 1, labels = "Random text")
dev.off()

