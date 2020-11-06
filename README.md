## Análisis de paisajes sonoros básico

Este repositorio tiene información esencial para comenzar a manipular archivos de audio usando R.

## Dependencias

Se debe tener instalado los siguientes paquetes:

- tuneR
- seewave

Nota: para instalar un paquete se debe ejecutar el comando `install.packages('<nombre del paquete>')`.

## Lectura de archivos de audio


```{r load_sound}
library(tuneR)
s = readWave('./audio_ejemplo/pipra.wav')
# acceder a los atributos del objeto
s_attrib = attributes(s)  
s_attrib$samp.rate
# imprimir los atributos del objeto
print(s)
```

## La dimensión temporal y frecuencial de la señal


```{r}
library(seewave)
oscillo(s)
timer(s, threshold = 25, msmooth = c(2048,0))
```

```{r}
mspec = meanspec(s, wl = 512)
fpeaks(mspec, threshold = 0.1)
spectro(s, wl = 1024, ovlp = 0.5, collevels = seq(-60, 0, 5), osc=T)
```

