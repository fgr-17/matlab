% -------------------------------------------------------------------------
%
%   Archivo:        test_wavelet_Morlet_Munich.m
%
%   Descripción:    prueba 
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

%% Calculo la ondita:

N = 128;                                                                    % Cantidad de muestras
Fs = 16000;                                                                 % Frecuencia de muestreo Fs = 16kHz

a = 4;                                                                      % Escala
b = N/2;                                                                    % Desplazamiento en el tiempo

[W1 t] = my_Morlet_Munich(a, b, N, Fs);                                     % Calculo la ondita

%% Grafico los resultados:

NF = 2;
NC = 1;

titulo = 'Wavelet Morlet-Munich';
xlab = 'k';
ylab = 'w[k]';
mode = 1;
color = '.g';

subplot(NF, NC, 1);     PlotTiempo(W1, t, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 2);     PlotFFT2(W1, Fs, '-b', 2); 

titulo = sprintf('Test W-Morlet modificada (Munich)');
set(gcf, 'Name', titulo);



