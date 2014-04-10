% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_17.m
%
%   Enunciado:  17. Dada la siguiente señal: 
%
%   f(t)= sin(2pi×16×t) + 2cos(2pi×4×t);
%
%   y considerando una frecuencia de muestreo fs = 128 Hz y N = 512 
%   puntos, realizar cambios de escala en 2 de las mismas, es decir f(t/2) 
%   y f(2t) y observe el espectro a fin de comparar niveles de resolución.
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

%% Seteo los parámetros del ejercicio:

Fs = 128;
N = 512;                                                                    % Cantidad de muestras del intervalo

% ---------------------- Armo la señal a analizar ---------------------- 

[fa ta] = mySin(1, 16, 0, N, Fs);                                           % Señal a analizar
fa = fa + mySin(2, 4, pi/4, N, Fs);

[fb tb] = mySin(1, 16, 0, N, Fs * 2);                                       % Señal a analizar
fb = fb + mySin(2, 4, pi/4, N, Fs * 2);

[fc tc] = mySin(1, 16, 0, N, Fs / 2);                                       % Señal a analizar
fc = fc + mySin(2, 4, pi/4, N, Fs / 2);

%% Grafico las señales obtenidas:

NF = 3;
NC = 2;

xlab = 't[s]';

titulo = 'Señal original';
ylab = 'f(t)';
mode = 0;
color = '-g';   
subplot(NF, NC, 1); PlotTiempo(fa, ta, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 2); PlotFFT2(fa, Fs, '-b', 2); 

titulo = 'Señal expandida';
ylab = 'f(t/2)';
mode = 0;
color = '-g';   
subplot(NF, NC, 3); PlotTiempo(fb, tb, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 4); PlotFFT2(fb, Fs, '-b', 2); 

titulo = 'Señal comprimida';
ylab = 'f(2*t)';
mode = 0;
color = '-g';   
subplot(NF, NC, 5); PlotTiempo(fc, tc, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 6); PlotFFT2(fc, Fs, '-b', 2); 

titulo = sprintf('Compresión y expansión de señales');
set(gcf, 'Name', titulo);


