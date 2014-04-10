% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_4_6_IIR.m
%
%   Enunciado:  6. Dise�e un filtro Pasa Altos Chebyshev IIR con una 
%   frecuencia de �3 dB a 1 KHz y una banda de atenuaci�n de 50 dB a 0.5 KHz.
%   La frecuencia de muestreo que se utiliza para el dise�o del filtro es de 
%   10 KHz. Verifique su dise�o graficando la respuesta al impulso del filtro 
%   como as� tambi�n su respuesta en frecuencia.
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

Num = [0.2010   -1.0049    2.0098   -2.0098    1.0049   -0.2010];       % Coeficientes del numerador filtro
Den = [1.0000   -2.1911    2.3342   -1.0238    0.0673    0.1851];       % Coeficientes del denominador filtro

%% Grafico los resultados:

fig1 = figure(); set(fig1, 'Name', 'Ejercicio 4.6 Filtros IIR'); impz(Num, Den);
fig2 = figure(); set(fig2, 'Name', 'Ejercicio 4.6 Filtros IIR'); freqz(Num, Den);