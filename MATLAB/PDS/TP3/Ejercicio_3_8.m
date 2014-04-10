% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_3_8.m
%
%   Enunciado: 8. La técnica de Submuestreo, consiste en tomar muestras de 
%   una señal con un cierto intervalo M de las mismas, es decir si se tiene 
%   una secuencia x[n], la secuencia submuestreada con M puntos será 
%   y[n] = x[nM]. La señal resultante contará con menos puntos que la señal 
%   original, y en el espectro de las frecuencias se producirá solapamiento. 
%   Implemente una rutina que realice el submuestreo de un vector con M=2.
%   Use la señal a = [1 3 5 7 9 8 6]. Investigue la existencia de rutinas
%   prediseñadas para tal efecto.
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

%% Inicialización de señales a usar y parámetros:

a_n = [1 3 5 7 9 8 6];                                                      % Inicializo la señal

N = size(a_n, 2);                                                           % Tamaño de la señal original
a_t = 1:N;                                                                  % Array de muestras

L = 2;                                                                      % Coeficiente de sobremuestreo                                

b_n = SubMuestrear(a_n, L);                                                 % Señal sobremuestreada
b_t = 1:size(b_n, 2);                                                       % Array de muestras

%% Grafico las señales:

fig0 = figure();
NF = 2;
NC = 2;
Fs = 1;

subplot(NF, NC, 1);
titulo = 'Señal original';
xlab = 't';
ylab = 'a[n]';
PlotTiempo(a_n, a_t, titulo, xlab, ylab, 1, 'g');
subplot(NF, NC, 2);
PlotFFT2(a_n, Fs, '-g', 2, NF, NC, 2);

subplot(NF, NC, 3);
titulo = 'Señal sobremuestreada';
xlab = 't';
ylab = 'b[n]';
PlotTiempo(b_n, b_t, titulo, xlab, ylab, 1, 'g');
subplot(NF, NC, 4);
PlotFFT2(b_n, Fs, '-g', 2, NF, NC, 4);


