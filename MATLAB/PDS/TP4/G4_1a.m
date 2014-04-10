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

N = 67 ;            % Cantidad de coeficientes del filtro
fs = 8e3 ;          % Fs = 8kHz

fc = 1e3 ;          % frecuencia de corte en 1kHz

wc = 2*pi*fc ;

tao = (N - 1)/2 ;   % retardo 

A = (wc/pi) ;
f0 = fc ;
t0 = tao ;

[sinc t] = mySinc( A, f0, t0 ,N , fs) ;

plot(t,sinc) ;

% [H, W] = freqz(sinc, 1, N) ;
 freqz(sinc, 1, N) ;

