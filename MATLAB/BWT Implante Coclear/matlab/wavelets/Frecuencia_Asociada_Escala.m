%%========================================================================================================================================
%
%>  @file           Frecuencia_Asociada_Escala.m
%
%>  @brief          Calculo la frecuencia central de una wavelet a una
%>  @brief          escala dada.
%
%>  @paramin        w    array de muestras de la ondita a analizar en fc del tiempo
%>  @paramin        t    eje temporal asociado a la ondita
%>  @paramin        a0   escala de la ondita
%
%
%>  @author         Roux, Federico G.(rouxfederico@gmail.com)
%>  @company        RT-DSP UTN.BA
%=========================================================================================================================================

function fAsc = Frecuencia_Asociada_Escala(w, Fs, a0)

f0_norm = Freq_Central_Wavelet(w);                                          % Calculo la frecuencia central normalizada de la Wavelet

if(a0 > 0)
    fAsc = (f0_norm * Fs * 14.7548 *a0);
else
    fAsc = 0;
end


end