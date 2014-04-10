%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo:    Ejercicio_3_2.m
%
%   Enunciado: Implemente una Rutina para correlacionar señales, ya sea Autocorrelación o correlación cruzada.
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Señales(PDS)
%   Departamento de Ing.Electrónica.
%   Facultad Buenos Aires
%   Universidad Tecnológica Nacional
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Inicialización:

clc;                        % Limpio el workspace
close all;                  % Cierro todas las figuras
clear all;                  % Cierro todas las variables


%% Cargo las señales de prueba:

Fs = 10000;

x_A = 1;
x_f0 = 1000;
x_ph0 = 0;
x_N = 128;

[x xT] = mySin(x_A, x_f0, x_ph0, x_N, Fs);

y_Am = 1;                                                                     % Am  : Amplitud pico de la señal modulante.
y_Ac = 0.2;                                                                   % Ac  : Amplitud pico de la señal portadora.
y_fm = 10;                                                                   % fm  : frecuencia de la señal modulante.
y_fc = 1000;                                                                 % fc  : frecuencia de la señal portadora
y_N = 1000;                                                                   % N   : Cantidad de muestras a generar.

[y yT] = myAM(y_Am, y_Ac, y_fm, y_fc, y_N, Fs);                               % Señal de AM


%% Contrasto mi algoritmo contra el de Matlab

sgn_prueba = my_Corr(x, y);
sgn_control = xcorr(x, y);

sgn_N = size(sgn_prueba, 2);
sgn_t = 0 : sgn_N - 1;

sgn_control = sgn_control(1 : sgn_N);

%% Muestro las señales en gráficos:

fig0 = figure();

subplot(2, 1, 1);
titulo = 'Señal generada con función propia : myCorr';
xlab = 't';
ylab = 'my_Corr(x)';
PlotTiempo(sgn_prueba, sgn_t, titulo, xlab, ylab, 0, '-g');

subplot(2, 1, 2);
titulo = 'Señal generada con función de matlab : xcorr';
xlab = 't';
ylab = 'xcorr(x)';
PlotTiempo(sgn_prueba, sgn_t, titulo, xlab, ylab, 0, '-g');




