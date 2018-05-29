################### Script Tarea 7.6 pregnta 2 ######################

## Generar un heatmap con estimados de Fst en 18 poblaciones de Pino de la Faja Volcánica Transmexicana.

## Cargar librerías
library(gplots)
library(vegan)
library(RColorBrewer)
library(Heatplus)


## Cargar datos
fst <- read.csv("../meta/3918_mybstr.csv") ## valores calculados de Fst

dat <- read.delim("../meta/N_3918.txt")  ## matriz con caracteres +, - y 0

head(fst)
head(dat)

## Convertir columna X en nombres de fila para que la matrix tenga solo los valores
row.names(fst) <- fst$X
head(fst)

## Quitar X
fst$X <- NULL
fst
class (fst)

## Crear paleta de colores
co.escala <- colorRampPalette(c("lightyellow", "Orange", "Darkred"),
                              space="Lab")(100)

## Hacer heatmap, necesit numeric matrix y fst es un data.frame
fst2 <-  data.matrix(fst)
 class(fst2)

heatmap(as.matrix(fst2), Rowv=NA, Colv = NA, col=structure(co.escala, names=dat))

## Convertir columna X en nombres de fila para que la matriz tenga solo los valores,
## esta vez con dat
row.names(dat) <- dat$X
head(dat)

## Quitar X
dat$X <- NULL
dat


## Incluir dat
dev.off() ##comando recomendado por RStudio para hacer el plot

## Plot, cellnote agrega dat en el heatmap, notecol cambia el color de dat en el heatmap
## trace quita las lineas del heatmap, main pone el titulo
heatmap.2(fst2, Rowv=NA, Colv = NA, cellnote=dat, notecol="black", trace="none",
          main= "FST CeSA4 vs ArMYBIX genes")



