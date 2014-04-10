%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo:    Ejercicio5_5.m
%
%   Enunciado:  Realice el filtrado adaptativo (en la configuración de 
%   cancelación adaptativa) de una señal de electrocardiograma, con ruido 
%   de línea de 50 Hz.
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Señales(PDS)
%   Departamento de Ing.Electrónica.
%   Facultad Buenos Aires
%   Universidad Tecnológica Nacional
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Inicialización:

clc;                        % Limpio el workspace
close all;                  % Cierro todas las figuras
clear all;                  % Cierro todas las variables

addpath '.\Sgn'


%% Obtengo la señal a filtrar y la señal de referencia.

load 'ecg_nt_long.txt';         % ECG a eliminar ruido del mismo

Sgn_In = ecg_nt_long';                  
N = size(Sgn_In, 2);            % Cantidad de elemntos de la señal.

f0 = 50;                        % Ruido de referencia de 50Hz
fs = 250;                       % Fs del ECG : 250[Hz]
ph0 = 0;
A = 1;

[Noise t]= mySin(A, f0, ph0, N, fs);

%% Hago la adaptación del filtro:

orden = 10;     % Orden del filtro FIR a adaptar.

yk = Cancelacion_Ruido(Sgn_In, Noise, orden);

%% Gráfico las señales de trabajo

fig1 = figure();    % Obtengo el handler de la figura
rotulo = sprintf('Cancelación de Interferencias fs = %.0fHz f_ref = %.0fHz', fs, f0);
set(fig1,'name',rotulo);

NF = 3;             % Cantidad de filas del gráfico
NC = 2;             % Cantidad de columnas del gráfico

subplot(NF, NC, 1);
PlotTiempo(Sgn_In, t, 'ECG con ruido', 't', 'd[n]', 0, 'g');
subplot(NF, NC, 2);
PlotFFT(Sgn_In, fs, 'Espectro del ECG con ruido', 1, 'D[k]');

subplot(NF, NC, 3);
PlotTiempo(Noise, t, 'Ruido de Referencia', 't', 'x[n]', 0, 'g');
subplot(NF, NC, 4);
PlotFFT(Noise, fs, 'Espectro del ruido de referencia X[k]', 1, 'X[k]');

subplot(NF, NC, 5);
PlotTiempo(yk, t, 'ECG sin ruido', 't', 'e[n]', 0, 'g');
subplot(NF, NC, 6);
PlotFFT(yk, fs, 'Espectro del ECG sin ruido', 1, 'E[k]');
