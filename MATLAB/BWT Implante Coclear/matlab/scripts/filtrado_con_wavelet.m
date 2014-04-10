%% ------------------------------------------------------------------------
%
%   Archivo : filtrado_con_wavelet.m
%
%   DescripciÃ³n : obtengo la respuesta en frecuencia de una wavelet
%   escalÃ¡ndola. Hago filtrado tradicional y CWT.
%
%   Autor : Federico G. Roux (rouxfederico@gmail.com)
%   
%   RT-DSP. UTN.BA 2013
%  ------------------------------------------------------------------------

%% InicializaciÃ³n del Script:

clc;
clear all;
close all;

%% Obtengo la forma de onda de la wavelet:

li = -8;                                                                    % Límite inferior del soporte de la ondita
ls = 8;                                                                     % Límite superior del soporte de la ondita
L = 1024;                                                                   % Cantidad de muestras de la wavelet
Ts = (ls - li)/(L - 1);                                                     % Período de muestreo


Fs = 1 / Ts;                                                                % Frecuencia de muestreo
[wcompleta tw]= my_Morlet(li, ls, L);                                       % Creo la wavelet afuera de las funciones de anÃ¡lisis

w1 = Escalar_Wavelet(wcompleta, tw, 1);                                     % Escalo la wavelet completa a escala 1 (lo que sería la Ondita madre)
w2 = Escalar_Wavelet(wcompleta, tw, 2);                                     % Escalo a escala 2
w1_2 = Escalar_Wavelet(wcompleta, tw, 0.5);                                 % Escala 0.5

f1 = scal2frq(1, 'Morl', Fs);
f2 = scal2frq(2, 'Morl', Fs);
f1_2 = scal2frq(0.5, 'Morl', Fs);

Fs2 = Fs * 2;
Fs1_2 = Fs / 2;

%% Grafico las funciones obtenidas:

NF = 3;                                                                     % Cantidad de filas del plot
NC = 2;                                                                     % Cantidad de col. del plot

subplot(NF, NC, 1);
titulo1 = sprintf('Wavelet madre fc = %f [Hz]', f1);
Grafico_Temporal(w1, Fs, li, titulo1, 't[s]', 'w[t]', '-g', 2, 'Escalado de Wavelets y Frecuencia Asociada');
subplot(NF, NC, 2);
Grafico_Frecuencial(w1, Fs, '-b', 2, NF, NC, 3);

subplot(NF, NC, 3);
titulo2 = sprintf('Escala 2 fc = %f [Hz]', f2);
Grafico_Temporal(w2, Fs2, li, titulo2, 't[s]', 'w[t]', '-g', 2, 'Escalado de Wavelets y Frecuencia Asociada');
subplot(NF, NC, 4);
Grafico_Frecuencial(w2, Fs2, '-b', 2, NF, NC, 4);

subplot(NF, NC, 5);
titulo1_2 = sprintf('Escala 0.5 fc = %f [Hz]', f1_2);
Grafico_Temporal(w1_2, Fs1_2 , li, titulo1_2, 't[s]', 'w[t]', '-g', 2, 'Escalado de Wavelets y Frecuencia Asociada');
subplot(NF, NC, 6);
Grafico_Frecuencial(w1_2, Fs1_2, '-b', 2, NF, NC, 6);
