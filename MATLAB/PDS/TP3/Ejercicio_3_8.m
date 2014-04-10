% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_3_8.m
%
%   Enunciado: 8. La t�cnica de Submuestreo, consiste en tomar muestras de 
%   una se�al con un cierto intervalo M de las mismas, es decir si se tiene 
%   una secuencia x[n], la secuencia submuestreada con M puntos ser� 
%   y[n] = x[nM]. La se�al resultante contar� con menos puntos que la se�al 
%   original, y en el espectro de las frecuencias se producir� solapamiento. 
%   Implemente una rutina que realice el submuestreo de un vector con M=2.
%   Use la se�al a = [1 3 5 7 9 8 6]. Investigue la existencia de rutinas
%   predise�adas para tal efecto.
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Se�ales(PDS)
%   Departamento de Ing.Electr�nica.
%   Facultad Buenos Aires
%   Universidad Tecnol�gica Nacional
%
% -------------------------------------------------------------------------

%% Inicializaci�n:

clc;                                                                        % Limpio el workspace
close all;                                                                  % Cierro todas las figuras
clear all;                                                                  % Cierro todas las variables

%% Inicializaci�n de se�ales a usar y par�metros:

a_n = [1 3 5 7 9 8 6];                                                      % Inicializo la se�al

N = size(a_n, 2);                                                           % Tama�o de la se�al original
a_t = 1:N;                                                                  % Array de muestras

L = 2;                                                                      % Coeficiente de sobremuestreo                                

b_n = SubMuestrear(a_n, L);                                                 % Se�al sobremuestreada
b_t = 1:size(b_n, 2);                                                       % Array de muestras

%% Grafico las se�ales:

fig0 = figure();
NF = 2;
NC = 2;
Fs = 1;

subplot(NF, NC, 1);
titulo = 'Se�al original';
xlab = 't';
ylab = 'a[n]';
PlotTiempo(a_n, a_t, titulo, xlab, ylab, 1, 'g');
subplot(NF, NC, 2);
PlotFFT2(a_n, Fs, '-g', 2, NF, NC, 2);

subplot(NF, NC, 3);
titulo = 'Se�al sobremuestreada';
xlab = 't';
ylab = 'b[n]';
PlotTiempo(b_n, b_t, titulo, xlab, ylab, 1, 'g');
subplot(NF, NC, 4);
PlotFFT2(b_n, Fs, '-g', 2, NF, NC, 4);


