% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_4_5_IIR.m
%
%   Enunciado:  5. Diseñe un filtro Pasa Bajos IIR usando una aproximación 
%   de Chebyshev con 1dB de ripple en la banda pasante, una frecuencia de 
%   corte de 500 Hz, 45 dB de atenuación a 1KHz. La frecuencia de muestreo 
%   que se utiliza para el diseño del filtro es de 10 KHz. Verifique su diseño 
%   graficando la respuesta al impulso del filtro como así también su respuesta 
%   en frecuencia.
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


%%  Cálculo del filtro:
%   El filtro fue calculado con la herramienta 'fdatool', y los
%   coeficientes calculados fueron los sgtes:

Num = [0.0102    0.0512    0.1024    0.1024    0.0512    0.0102];       % Coeficientes del numerador filtro
Num = Num / 1000;

Den = [1.0000   -4.5879    8.5399   -8.0560    3.8495   -0.7452];       % Coeficientes del denominador filtro

%% Grafico los resultados:

fig1 = figure(); set(fig1, 'Name', 'Ejercicio 4.4 Filtros IIR'); impz(Num, Den);
fig2 = figure(); set(fig2, 'Name', 'Ejercicio 4.4 Filtros IIR'); freqz(Num, Den);