% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_4_1_IIR.m
%
%   Enunciado:  1. Dada la respuesta en frecuencia de un filtro Pasa Bajos de
%   primer orden RC, se pide implementarlo en forma digital con un filtro 
%   IIR (mediante el uso de la Transformada Bilineal) con las siguientes 
%   características: Frecuencia de Muestreo fs=1 KHz y una frecuencia de 3 
%   dB del filtro de 60 Hz.
%               2. Verifique la correcta implementación del filtro IIR 
%   anterior mediante MatLab calculando y graficando su respuesta al 
%   impulso, su función de Transferencia y graficando la salida temporal 
%   y(t) que se obtiene de haber filtrado la señal de entrada 
%   x(t) = 2 sen(2p50 × t )+ sen(2p300 × t ) con el filtro digital IIR.
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Señales(PDS)
%   Departamento de Ing.Electrónica.
%   Facultad Buenos Aires
%   Universidad Tecnológica Nacional
%
% -------------------------------------------------------------------------

%% Inicialización:

clc;                                                                        % Limpio el workspace
close all;                                                                  % Cierro todas las figuras
clear all;                                                                  % Cierro todas las variables

addpath     '.\\sgn'

%% Calculo el filtro

f0 = 60 ;                                                                   % Frecuencia a eliminar
w0 = 2*pi*f0 ;                                                              % Pulsación a eliminar
fs = 1e3 ;                                                                  % Frecuencia de muestreo de la señal

N = [0 w0];                                                                 % Numerador del filtro en dominio 's'
D = [1 w0];                                                                 % Denominador del filtro en dominio 's'

H = tf(N, D, 's');                                                          % Armo la transferencia del filtro en dominio 's'

[B A] = bilinear(N, D, fs);                                                 % Transformo la transferencia del filtro al domino 'z'

%% Calculo la señal de entrada

xN = 300;
x = mySin(2, 50, 0, xN, fs) + mySin(1, 300, 0, xN, fs);

t = (0:(xN - 1)) / fs;

y = filter(B, A, x);


%% Grafico los resultados:

f1 = figure();
freqs(N, D);
set(f1, 'Name', 'Filtro analógico: Respuesta en el dominio s = jw');

f2 = figure();
freqz(B, A, fs);
set(f2, 'Name', 'Filtro digital: Respuesta en frecuencia');

NF = 2;
NC = 2;

f3 = figure();
set(f3, 'Name', 'Filtrado de las señales con RC digital IIR');

subplot(NF, NC, 1);
titulo = 'Señal a filtrar';
xlab = 't[s]';
ylab = 'x(t)';
mode = 0;
color = '-g';
PlotTiempo(x, t, titulo, xlab, ylab, mode, color)

subplot(NF, NC, 2); PlotFFT2(x, fs, '-g', 2);

subplot(NF, NC, 3);
titulo = 'Señal filtrada';
xlab = 't[s]';
ylab = 'y(t)';
mode = 0;
color = '-g';
PlotTiempo(y, t, titulo, xlab, ylab, mode, color)

subplot(NF, NC, 4); PlotFFT2(y, fs, '-g', 2);
