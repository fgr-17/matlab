% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_3_7.m
%
%   Enunciado: 7. Analice la propiedad de Transformada de Fourier de una 
%   Secuencia (TFS) que consiste en sobremuestrear a una señal. Implemente 
%   una rutina que permita realizar el sobremestreo con L=2 de un vector
%   genérico. Compruebe el resultado con la señal a[n] = [2 5 3]. Modifique
%   el programa anterior para que permita un sobremuestreo genérico L. 
%   Investigue la existencia de rutinas prediseñadas para tal efecto.
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

a_n = [2 5 3];                                                              % Inicializo la señal

N = size(a_n, 2);                                                           % Tamaño de la señal original
a_t = 1:N;                                                                  % Array de muestras

L = 2;                                                                      % Coeficiente de sobremuestreo                                

b_n = SobreMuestrear(a_n, L);                                               % Señal sobremuestreada
b_t = 1:(L * N);                                                            % Array de muestras
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


