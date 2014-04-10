% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_4_6_IIR.m
%
%   Enunciado:  6. Diseñe un filtro Pasa Altos Chebyshev IIR con una 
%   frecuencia de –3 dB a 1 KHz y una banda de atenuación de 50 dB a 0.5 KHz.
%   La frecuencia de muestreo que se utiliza para el diseño del filtro es de 
%   10 KHz. Verifique su diseño graficando la respuesta al impulso del filtro 
%   como así también su respuesta en frecuencia.
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

Num = [0.2010   -1.0049    2.0098   -2.0098    1.0049   -0.2010];       % Coeficientes del numerador filtro
Den = [1.0000   -2.1911    2.3342   -1.0238    0.0673    0.1851];       % Coeficientes del denominador filtro

%% Grafico los resultados:

fig1 = figure(); set(fig1, 'Name', 'Ejercicio 4.6 Filtros IIR'); impz(Num, Den);
fig2 = figure(); set(fig2, 'Name', 'Ejercicio 4.6 Filtros IIR'); freqz(Num, Den);