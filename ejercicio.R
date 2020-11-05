# Paso a paso para calcular un 'graphical soundscape'
# Autor = Juan Sebastián Ulloa
# julloa#humboldt.org.co

# Cargar librerías
library(tuneR)
library(seewave)

# Cargar audio
s = readWave('./audio_ejemplo/pipra.wav')

# 1. Calcular el espectro de frecuencias
mspec = meanspec(s, wl = 256, wn = 'hanning', norm = F, plot=T)

# 2. Buscar picos de frecuencia y combinar en un dataframe
peaks = fpeaks(mspec, threshold = 0.003, freq = 0, plot=T)
colnames(mspec) <- c('freq', 'amp')
colnames(peaks) <- c('freq', 'peak_amp')
speak = as.data.frame(merge(mspec, peaks, by='freq', all=T))

# 3. Binarizar picos
speak$peak_amp[is.na(speak$peak_amp)] <- 0
speak$peak_amp[speak$peak_amp > 0] <- 1

# LOOP PARA ANALIZAR TODOS LOS ARCHIVOS
path_files = '/Volumes/lacie_exfat/BST_ejemplo_PPII/audio/VALLES/V6DA/'
flist = list.files(path_files, recursive = T, pattern = '.WAV', ignore.case = T)
features = list()
for(idx in 1:nrow(df)){
  fname = df$path_audio[idx]
  message(idx,'/',nrow(df), ': ',fname)
  ## COMPLETAR
  
  ## COMPLETAR
}

# 4. Aggragar los picos de frecuencia por hora a lo largo de los días de muestreo

# 5. Calcular la proporción de picos por hora y banda de frecuencia


