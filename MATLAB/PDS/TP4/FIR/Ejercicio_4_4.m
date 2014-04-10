% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_4_4.m
%
%   Enunciado: 4. Diseñe un filtro FIR Notch de segundo orden (N=2) que 
%   elimine la frecuencia de ruido de línea de 50 Hz de un Electrocardiógrafo.
%   La frecuencia a la cual se muestrea la señal de ECG es de 250 Hz (más del 
%   doble del ancho de banda de una señal de electrocardiograma que es 
%   aproximadamente 100 Hz en el humano).
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

addpath     '.\\sgn'

%% Calculo el filtro

f0 = 50 ;                                                                   % Frecuencia a eliminar
w0 = 2*pi*f0 ;                                                              % Pulsación a eliminar
Q0 = 100 ;                                                                  % Selectividad del filtro
fs = 250 ;                                                                  % Frecuencia de muestreo de la señal

N = [1 0 w0^2] ;                                                            % Numerador del filtro en dominio 's'
D = [1 w0/Q0 w0^2];                                                         % Denominador del filtro en dominio 's'

H = tf(N, D, 's');                                                          % Armo la transferencia del filtro en dominio 's'

[B A] = bilinear(N, D, fs);                                                 % Transformo la transferencia del filtro al domino 'z'

orden = 2;                                                                  % Orden del filtro FIR
[h, t] = impulse(B, A, orden + 1);                                          % Calculo la respuesta al impulso del filtro IIR

%% Levanto la señal de ECG y le sumo ruido

load Tp3ecg.txt;                                                            % Onda de Ecg
x = Tp3ecg;                                                                 % Señal a filtrar
xN = size(x);                                                               % Largo de la señal

nA = max(x)/10;                                                             % El ruido de línea tiene un 10% del máximo de señal
nf0 = 50;                                                                   % Frecuencia central del ruido 
nN = xN;

n = mySin(nA, nf0, 0, nN, fs);

sgn = x' + n;
tsgn = (0 : (xN - 1)) / fs;

%% Filtro la señal con el filtro calculado

y = filter(h, 1, sgn);


%% Grafico los resultados:

NF = 2;
NC = 2;

subplot(NF, NC, [1 2]);
titulo = 'Señal a filtrar';
xlab = 't[s]';
ylab = 'ECG con ruido';
mode = 0;
color = '-g';
PlotTiempo(sgn, tsgn, titulo, xlab, ylab, mode, color);

subplot(NF, NC, [3 4]);
titulo = 'Señal filtrada';
xlab = 't[s]';
ylab = 'ECG filtrado Notch FIR';
mode = 0;
color = '-g';
PlotTiempo(x, tsgn, titulo, xlab, ylab, mode, color);


