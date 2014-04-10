%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo:    Ejercicio5_6.m
%
%   Enunciado:  Realice el filtrado adaptativo (en la configuración de cancelación predictiva) de una señal de electrocardiograma,
%   con ruido de línea de 50 Hz.
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

clc;                                                                    % Limpio el workspace
close all;                                                              % Cierro todas las figuras
clear all;                                                              % Cierro todas las variables

%% Obtengo la señal a filtrar y la señal de referencia.

load 'ecg_nt_long.txt';                                                 % ECG a eliminar ruido del mismo

Sgn_In = ecg_nt_long';                  
N = size(Sgn_In, 2);                                                    % Cantidad de elemntos de la señal.

fs = 250;                                                               % Fs del ECG : 250[Hz]

t = 0 : (N-1);
t = t/fs;

%% Hago la adaptación del filtro:

orden = 10;                                                             % Orden del filtro FIR a adaptar.
retardo = 100;                                                          % Retardo del filtro predictivo

[yk t_yk]= Filtro_Predictivo(Sgn_In, orden, retardo);

t_yk = t_yk/fs;

%% Gráfico las señales de trabajo

fig1 = figure();                                                        % Obtengo el handler de la figura
rotulo = sprintf('Cancelación de Interferencias fs = %.0fHz', fs);
set(fig1,'name',rotulo);

NF = 2;                                                                 % Cantidad de filas del gráfico
NC = 2;                                                                 % Cantidad de columnas del gráfico

subplot(NF, NC, 1);
PlotTiempo(Sgn_In, t, 'ECG con ruido', 't', 'd[n]', 0, 'g');
subplot(NF, NC, 2);
PlotFFT(Sgn_In, fs, 'Espectro del ECG con ruido', 1, 'D[k]');

subplot(NF, NC, 3);
PlotTiempo(yk, t_yk, 'ECG sin ruido', 't', 'e[n]', 0, 'g');
subplot(NF, NC, 4);
PlotFFT(yk, fs, 'Espectro del ECG sin ruido', 1, 'E[k]');
