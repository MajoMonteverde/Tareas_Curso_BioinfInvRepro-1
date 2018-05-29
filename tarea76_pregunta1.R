############## Tarea 7.6 pregunta 1 ##############################


## Cargar librerías
library(maps)
library(ape)
library(devtools)
library(phytools)

## Leer archivos trees
trees <- read.nexus("../data/All_Pmac_Unique_hap_seqs_strict_100M.trees")

## ¿Cuántos árboles tengo?
str(trees)
#Class "multiPhylo"
#List of 10001  (10001 árboles)


## Seleccionar 100 arboles, con una semilla de 1058
set.seed(1058)
random.trees<-sample(trees,size=100)


## Arbol resumen utilizando symmetric.difference
tree <- averageTree(random.trees, start=NULL, method="symmetric.difference")

## Cargar archivo P_macro.csv
dat <- read.csv("../meta/P_macro.csv")

## Contar el numero de cacholates hembras (F) y el de machos (M)
## Cargar libreria
library(plyr)
count(dat, "SEX")

## F=38, M=18


## Graficar arbol resumen (tree) donde tiplabels sean puntos coloreados segun cuenca oceanica de la que proviene
## cada individuo. Incluir leyenda.

#Plot tree
plot.phylo(tree, edge.width = 2, cex=0.5)

#Asignar colores de acuerdo al numero de variables en Ocean
colnames(dat)
head(dat)
cols <- length(levels(dat$Ocean))
palette(rainbow(cols))

## Poner tiplabels como puntos coloreados
plot(tree, edge.width=2, show.tip=FALSE)

#Agregar tip labels que corresponden a la categoria de Ocean
tiplabels(pch=20, col=dat$Ocean)

# Agregar leyenda
legend(x= "bottomleft", legend=levels(dat$Ocean), pch=19, col=1:cols, cex=1, , bty="n")  


## Carga maptools
library(maptools)

## Cargar archivo GSHHS_i_L1.shp
map <- readShapePoly("../data/gshhg-shp-2.3.7/GSHHS_shp/i/GSHHS_i_L1.shp")
plot(map)

## Colorear los continentes de color cafe o gris
plot(map, border="grey", col="grey")

## Plotear puntos de muestreo de los cachalotes.
points(dat$Longitude, dat$Latitude, pch=19, col="black", cex=0.4)

## Colorear puntos segun el clado asignado en el 
head(dat)
col2 <- length(levels(dat$clade))
points(dat$Longitude, dat$Latitude, pch=19, col=1:col2, cex=0.4)



