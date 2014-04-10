% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_4_5_IIR.m
%
%   Enunciado:  5. Dise�e un filtro Pasa Bajos IIR usando una aproximaci�n 
%   de Chebyshev con 1dB de ripple en la banda pasante, una frecuencia de 
%   corte de 500 Hz, 45 dB de atenuaci�n a 1KHz. La frecuencia de muestreo 
%   que se utiliza para el dise�o del filtro es de 10 KHz. Verifique su dise�o 
%   graficando la respuesta al impulso del filtro como as� tambi�n su respuesta 
%   en frecuencia.
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


%%  C�lculo del filtro:
%   El filtro fue calculado con la herramienta 'fdatool', y los
%   coeficientes calculados fueron los sgtes:

Num = [0.0102    0.0512    0.1024    0.1024    0.0512    0.0102];       % Coeficientes del numerador filtro
Num = Num / 1000;

Den = [1.0000   -4.5879    8.5399   -8.0560    3.8495   -0.7452];       % Coeficientes del denominador filtro

%% Grafico los resultados:

fig1 = figure(); set(fig1, 'Name', 'Ejercicio 4.4 Filtros IIR'); impz(Num, Den);
fig2 = figure(); set(fig2, 'Name', 'Ejercicio 4.4 Filtros IIR'); freqz(Num, Den);