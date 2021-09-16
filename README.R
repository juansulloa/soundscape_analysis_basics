#' ---
#' title: "Manipulación básica de archivos de audio en R"
#' author: "Juan Sebastián Ulloa"
#' date: "11/3/2020"
#' output: rmarkdown::github_document
#' ---
#' 
## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE,
                      fig.path = 'figuras/',
                      warning = FALSE)

#' 
#' Este repositorio tiene información esencial para comenzar a manipular archivos de audio usando R.
#' 
#' ## Dependencias
#' 
#' Se deben tener los siguientes paquetes instalados:
#' 
#' - tuneR
#' - seewave
#' 
#' Nota: para instalar un paquete se debe ejecutar el comando `install.packages('<nombre del paquete>')`.
#' 
#' ## Lectura de archivos de audio
#' 
#' El paquete `tuneR` tiene funciones simples que facilitan cargar y evaluar los metadatos de archivos de audio en R.
#' 
## ----load_sound----------------------------------------------------------
library(tuneR)
s = readWave('./audio_ejemplo/spinetail.wav')
# imprimir los atributos del objeto
print(s)

#' 
#' Los metadatos son almacenados en el objeto como atributos. Es posible acceder a estos atributos usando la función `attributes` de R.
#' 
## ----load_sound_2--------------------------------------------------------
s_attrib = attributes(s)
s_attrib$samp.rate

#' 
#' ## La dimensión temporal y frecuencial de la señal
#' 
#' El paquete `seewave` permite calcular características en el dominio del tiempo y de la frecuencia. Usando las funciones `oscilo` y `timer` vamos a evaluar las dinámicas temporales, con `meanspec` vamos a evaluar el contenido frecuencial, y con `spectro` vamos a observar las dinámicas en ambas dimensiones.
#' 
## ----temporal_dim--------------------------------------------------------
library(seewave)
par(mfrow=c(1,1), mar=c(5.1, 4.1, 4.1, 2.1))
oscillo(s)
timer(s, threshold = 25, msmooth = c(2048,0))

#' 
## ----frequency_dim-------------------------------------------------------
mspec = meanspec(s, wl = 512)
fpeaks(mspec, threshold = 0.1)
spectro(s, wl = 1024, ovlp = 0.5, collevels = seq(-60, 0, 5), osc=T)

