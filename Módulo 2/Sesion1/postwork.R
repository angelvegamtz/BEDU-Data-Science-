getwd()

# Fijando el directorio de trabajo

setwd("/home/marco/Documentos/BEDU/modulo2/sesion1/postwork") # Depende del usuario


# Del data frame que resulta de importar los datos a R, extrae las columnas 
# que contienen los números de goles anotados por los equipos que jugaron en casa 
# (FTHG) y los goles anotados por los equipos que jugaron como visitante (FTAG).

gol <- read.csv("SP1.csv") # El archivo csv debe estar en el directorio de trabajo
gol # Variable con los datos de soccer de la temporada 2019/2020 de la 
    # primera división de la liga española.

# Columna que contiene los goles anotados  por los equipos que jugaron en casa.
local <- gol$FTHG

# Los goles anotados por los equipos que jugaron como visitante.
visitante <- gol$FTAG

# Sumamos todos los goles de local 
total <- 0

for(i in local) {
  total <- i + total
  #print(i)
}
print(total)

# Sumamos todos los goles de local

total.dos <- 0

for(i in visitante) {
  total.dos <- i + total.dos
  #print(i)
}
print(total.dos)

# Suma de los goles de local y visitante.
total.total <- total + total.dos
#(mifile <- data.frame(local = local, visitante = visitante))

# Probabilidad (marginal) 
marginal.casa <- (total / total.total)
marginal.visita <- (total.dos / total.total)

# Probabilidad (conjunta) 
marginal.conjunta <- marginal.casa * marginal.visita

# Consulta cómo funciona la función table en R al ejecutar en la consola ?table
?table
#Prueba de la función table
barplot(table(marginal.local))
barplot(table(marginal.visita))