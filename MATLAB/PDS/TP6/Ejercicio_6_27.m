% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_27.m
%
%   Enunciado:  27. Investigue el comando MatLab cwt (Transformada Ondita 
%   Continua Unidimensional). Evalue la misma con la señal 
%   h[n] = {8,8,8,8,0,0,0,0}, utilizando 10 escalas y la ondita Haar, es 
%   decir y [n] =d [n]-d [n -1].
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
Fs = 1;

h = [8, 8, 8, 8, 0, 0, 0, 0];                                               % Señal propuesta en el enunciado
k = 0:size(h, 2) - 1;            

n_escalas = 10;                                                             % Cantidad de escalas a analizar
wavelet = 'haar';                                                           % Ondita propuesta en el enunciado

coef = cwt(h, n_escalas, wavelet, 'lvl');                                   % Calculo los coeficientes.


NF = 1;
NC = 2;

fig = figure();
titulo = ('Señal a analizar');
xlab = 't[s]';
ylab = 'h[t]';
mode = 0;
color = '-g';
subplot(NF, NC, 1); PlotTiempo(h, k, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 2); PlotFFT(h, Fs, titulo, 0, ylab);