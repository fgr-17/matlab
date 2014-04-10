%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo:    Ejercicio5_6.m
%
%   Enunciado:  Realice el filtrado adaptativo (en la configuraci�n de cancelaci�n predictiva) de una se�al de electrocardiograma,
%   con ruido de l�nea de 50 Hz.
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Se�ales(PDS)
%   Departamento de Ing.Electr�nica.
%   Facultad Buenos Aires
%   Universidad Tecnol�gica Nacional
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Inicializaci�n:

clc;                                                                    % Limpio el workspace
close all;                                                              % Cierro todas las figuras
clear all;                                                              % Cierro todas las variables

%% Obtengo la se�al a filtrar y la se�al de referencia.

load 'ecg_nt_long.txt';                                                 % ECG a eliminar ruido del mismo

Sgn_In = ecg_nt_long';                  
N = size(Sgn_In, 2);                                                    % Cantidad de elemntos de la se�al.

fs = 250;                                                               % Fs del ECG : 250[Hz]

t = 0 : (N-1);
t = t/fs;

%% Hago la adaptaci�n del filtro:

orden = 10;                                                             % Orden del filtro FIR a adaptar.
retardo = 100;                                                          % Retardo del filtro predictivo

[yk t_yk]= Filtro_Predictivo(Sgn_In, orden, retardo);

t_yk = t_yk/fs;

%% Gr�fico las se�ales de trabajo

fig1 = figure();                                                        % Obtengo el handler de la figura
rotulo = sprintf('Cancelaci�n de Interferencias fs = %.0fHz', fs);
set(fig1,'name',rotulo);

NF = 2;                                                                 % Cantidad de filas del gr�fico
NC = 2;                                                                 % Cantidad de columnas del gr�fico

subplot(NF, NC, 1);
PlotTiempo(Sgn_In, t, 'ECG con ruido', 't', 'd[n]', 0, 'g');
subplot(NF, NC, 2);
PlotFFT(Sgn_In, fs, 'Espectro del ECG con ruido', 1, 'D[k]');

subplot(NF, NC, 3);
PlotTiempo(yk, t_yk, 'ECG sin ruido', 't', 'e[n]', 0, 'g');
subplot(NF, NC, 4);
PlotFFT(yk, fs, 'Espectro del ECG sin ruido', 1, 'E[k]');
