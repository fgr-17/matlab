% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_17.m
%
%   Enunciado:  17. Dada la siguiente se�al: 
%
%   f(t)= sin(2pi�16�t) + 2cos(2pi�4�t);
%
%   y considerando una frecuencia de muestreo fs = 128 Hz y N = 512 
%   puntos, realizar cambios de escala en 2 de las mismas, es decir f(t/2) 
%   y f(2t) y observe el espectro a fin de comparar niveles de resoluci�n.
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Se�ales(PDS)
%   Departamento de Ing.Electr�nica.
%   Facultad Buenos Aires
%   Universidad Tecnol�gica Nacional
%
% -------------------------------------------------------------------------

%% Inicializaci�n:

clc;                                                                        % Limpio el workspace
close all;                                                                  % Cierro todas las figuras
clear all;                                                                  % Cierro todas las variables

%% Seteo los par�metros del ejercicio:

Fs = 128;
N = 512;                                                                    % Cantidad de muestras del intervalo

% ---------------------- Armo la se�al a analizar ---------------------- 

[fa ta] = mySin(1, 16, 0, N, Fs);                                           % Se�al a analizar
fa = fa + mySin(2, 4, pi/4, N, Fs);

[fb tb] = mySin(1, 16, 0, N, Fs * 2);                                       % Se�al a analizar
fb = fb + mySin(2, 4, pi/4, N, Fs * 2);

[fc tc] = mySin(1, 16, 0, N, Fs / 2);                                       % Se�al a analizar
fc = fc + mySin(2, 4, pi/4, N, Fs / 2);

%% Grafico las se�ales obtenidas:

NF = 3;
NC = 2;

xlab = 't[s]';

titulo = 'Se�al original';
ylab = 'f(t)';
mode = 0;
color = '-g';   
subplot(NF, NC, 1); PlotTiempo(fa, ta, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 2); PlotFFT2(fa, Fs, '-b', 2); 

titulo = 'Se�al expandida';
ylab = 'f(t/2)';
mode = 0;
color = '-g';   
subplot(NF, NC, 3); PlotTiempo(fb, tb, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 4); PlotFFT2(fb, Fs, '-b', 2); 

titulo = 'Se�al comprimida';
ylab = 'f(2*t)';
mode = 0;
color = '-g';   
subplot(NF, NC, 5); PlotTiempo(fc, tc, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 6); PlotFFT2(fc, Fs, '-b', 2); 

titulo = sprintf('Compresi�n y expansi�n de se�ales');
set(gcf, 'Name', titulo);


