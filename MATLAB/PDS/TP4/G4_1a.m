% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_3_8.m
%
%   Enunciado: 8. La técnica de Submuestreo, consiste en tomar muestras de 
%   una señal con un cierto intervalo M de las mismas, es decir si se tiene 
%   una secuencia x[n], la secuencia submuestreada con M puntos será 
%   y[n] = x[nM]. La señal resultante contará con menos puntos que la señal 
%   original, y en el espectro de las frecuencias se producirá solapamiento. 
%   Implemente una rutina que realice el submuestreo de un vector con M=2.
%   Use la señal a = [1 3 5 7 9 8 6]. Investigue la existencia de rutinas
%   prediseñadas para tal efecto.
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

%% Inicialización de señales a usar y parámetros:

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

