% -------------------------------------------------------------------------
%
%   Archivo:        test_wavelet_Morlet.m
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

N = 1024;                                                                   % Cantidad de muestras
soporte = 8;                                                                % Soporte efectivo de la wavelet
Fs = soporte / (N - 1);                                                                 % Frecuencia de muestreo Fs = 16kHz

a = 1;                                                                      % Escala
b = (N - 1)/2;                                                              % Desplazamiento en el tiempo

li = -8;
ls = 8;

% [W1 t1] = my_Morlet(a, b, N);                                             % Calculo la ondita
[W1 t1] = my_Morlet(li, ls,  N);                                            % Calculo la ondita

[W2 t2] = morlet(li, ls, N);                                                % Wavelet Morlet de Matlab

W1 = Escalar_Wavelet(W1, t1, 1);
W2 = Escalar_Wavelet(W2, t2, 1);

W_err = W2 - W1;                                                            % Diferencias entre las 2 onditas

%% Grafico los resultados:

NF = 3;
NC = 2;

titulo = 'Wavelet Morlet diseñada';
xlab = 'k';
ylab = 'w[k]';
modo = 2;
color = '-g';

subplot(NF, NC, 1);     Grafico_Temporal(W1, Fs, li, titulo, xlab, ylab, color, modo, 'Comparacion Wavelets'); % PlotTiempo(W1, t1, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 2);     Grafico_Frecuencial(W1, Fs, color, 2, NF, NC, 2);                                   % PlotFFT2(W1, Fs, '-b', 2); 

titulo = 'Wavelet Morlet matlab';
xlab = 'k';
ylab = 'w[k]';
modo = 2;
color = '-g';
subplot(NF, NC, 3);     Grafico_Temporal(W2, Fs, li, titulo, xlab, ylab, color, modo, 'Comparacion Wavelets'); % PlotTiempo(W1, t1, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 4);     Grafico_Frecuencial(W2, Fs, color, 2, NF, NC, 4);                                   % PlotFFT2(W1, Fs, '-b', 2); 

titulo = 'Error';
xlab = 'k';
ylab = 'error[k]';
modo = 1;
color = '-b';
subplot(NF, NC, [5 6]);     Grafico_Temporal(W_err, Fs, 0, titulo, xlab, ylab, color, modo, 'Comparacion Wavelets'); % PlotTiempo(W1, t1, titulo, xlab, ylab, mode, color);

titulo = sprintf('Test Wavelet Morlet');
set(gcf, 'Name', titulo);
