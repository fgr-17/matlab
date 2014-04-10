%% ------------------------------------------------------------------------
%
%   Archivo : Generar_Sgn_DAC_LPC17xx.m
%
%   Descripción : Genero una señal para utilizar como salida del DAC del
%   LPC1769. Se genera una señal en 10 bits y se desplaza 6 bits hacia la
%   izquierda.
%
%   Autor : Federico G. Roux (froux@favaloro.edu.ar)
%
%   Laboratorio de uP. Universidad Favaloro 2013
% -------------------------------------------------------------------------

%% Inicializo el script

clc;
close all;
clear all;

%% Valores para generar la señal.


bits_DAC = 10;                                                              % Cantidad de bits del DAC
min_DAC = 0;                                                                % Valor mínimo del DAC
max_DAC = 2^(bits_DAC - 1);                                                       % Valor máximo del DAC

span_DAC = max_DAC - min_DAC;                                               % Rango dinámico del DAC

bits_res = 6;                                                               % Cantidad de bits reservados a dejar libres

L = 2048;                                                                    % Cantidad de muestras de la señal

%% Genero la señal

k = 0:(L - 1);                                                              % Array de muestras de la señal

Fs = 1000;                                                                  % Frecuencia de muestreo
Ts = 1/Fs;                                                                  % Período de muestreo

t = k*Ts;                                                                   % Array de tiempo

f0 = 1;                                                                     % Frecuencia inicial
f1 = 200;                                                                   % Frecuencia final de barrido
t1 = (L - 10)*Ts;                                                           % Tiempo donde llega a f1


x = chirp(t, f0, t1, f1, 'linear');                               % Genero la señal

x_int = fix(x * span_DAC/2) + span_DAC/2;                                                  % llevo la señal a valores enteros
x_int = x_int * (2 ^ bits_res);                                             % desplzao los 6 bits reservados5

PlotTiempo(x_int, t, 'Señal Chirp 1-200Hz', 't[s]', 'x[t]', 0, '-g');           % Muestro señal en pantalla

%% Guardo señal en un archivo:

save2fileCSV_hex_fixed('./chirp.h', x_int, 16, 0);              % Guardo señal en un archivo para importar en C

