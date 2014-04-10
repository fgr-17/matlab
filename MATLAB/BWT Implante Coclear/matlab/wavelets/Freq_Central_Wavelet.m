%%=========================================================================================================================================
%
%>  @file           Freq_Central_Wavelet.m
%
%>  @brief          Calculo el m�ximo de la frecuencia normalizada respecto
%>  @brief          a la frecuencia de muestreo.
%
%>  @paramin        w       array de muestras de la ondita a analizar en fc del tiempo
%>  @paramin        t       eje temporal asociado a la ondita
%>  @paramin        Fs      Frecuencia de muestreo del sistema.
%
%
%>  @author        Roux, Federico G.(rouxfederico@gmail.com)
%>  @company       RT-DSP UTN.BA
% =========================================================================================================================================

function fn_max = Freq_Central_Wavelet(w)

L = length(w);                                                              % Calculo el largo de la wavelet
W = abs(fft(w));                                                            % Calculo el espectro de la Wavelet

[maxW maxI] = max(W);                                                       % Calculo el máximo y su posición

fn_max = (maxI - 1) / (L - 1);                                              % fn_max : frecuencia normalizada donde ocurre el máximo

end