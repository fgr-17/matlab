% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_18.m
%
%   Enunciado:  18. Comprobar que para distintas escalas, es lo mismo 
%   considerar: a) g(t/a) con un intervalo t = [-5a, 5a] muestreado a 
%   intervalos enteros que b) g(t) con el intervalo t=[- 5, 5] con un 
%   intervalo de muestreo 1 a . Utilice para su ejemplo, una Ventana de
%   Gabor Gaussiana.
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

% ---------------------- Parámetros de la primer venana de gabor ----------------------

Fs = 1;                                                                     % Muestreo a intervalos enteros
a = 3;                                                                      % Contracción de la ventana

alfa = 1/16;                                                                % Parámetro

ta = -(5 * a);                                                              % Tiempo de inicio del intervalo
tb =  (5 * a);                                                          	% Tiempo de fin del intervalo
Dt = tb - ta;                                                               % Longitud del intervalo de tiempo

t0 = Dt / 2;                                                                % Centro la ventana en cero
N = Dt * Fs;                                                                % Cantidad de muestras


[W1 tW]= my_Gabor_Win_2(alfa, a, t0, N, Fs);                                % Ventana de análisis


NF = 2;
NC = 2;
xlab = 't[s]';

% ---------------------- Parámetros de la 2da venana de gabor ----------------------

a = 3;                                                                      % Contracción de la ventana
Fs = a;                                                                     % Muestreo a intervalos enteros


alfa = 1/16;                                                                % Parámetro

ta = -(5);                                                                  % Tiempo de inicio del intervalo
tb =  (5);                                                                  % Tiempo de fin del intervalo
Dt = tb - ta;                                                               % Longitud del intervalo de tiempo

t0 = Dt / 2;                                                                % Centro la ventana en cero
N = Dt * Fs;                                                                % Cantidad de muestras


[W2 tW2]= my_Gabor_Win_2(alfa, 1, t0, N, Fs);                                % Ventana de análisis


%% Grafico las señales de resultado:      

NF = 2;
NC = 2;
xlab = 't[s]';

titulo = sprintf('V.Gabor muestreada a Fs = 1');
ylab = 'W1(t)';
mode = 0;
color = '.g';
subplot(NF, NC, 1); PlotTiempo(W1, tW, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 2); PlotFFT2(W1, Fs, '-b', 2);

titulo = sprintf('V.Gabor muestreada a Fs = 1/a');
ylab = 'W2(t)';
mode = 0;
color = '.g';
subplot(NF, NC, 3); PlotTiempo(W2, tW2, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 4); PlotFFT2(W2, Fs, '-b', 2);

titulo = sprintf('Ventana de Gabor Modulada');
set(gcf, 'Name', titulo);
