% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_4_7_IIR.m
%
%   Enunciado:  7. Diseñe un filtro Pasa Banda IIR Elíptico de 6to. orden 
%   centrado en 4 KHz con 1 Khz de ancho de banda, un ripple en la banda de 
%   paso de 1 dB y un ripple en la banda de atenuación de por lo menos 100 dB.
%   La frecuencia de muestreo que se utiliza para el diseño del filtro es de 40 
%   KHz. Verifique su diseño graficando la respuesta al impulso del filtro como 
%   así también su respuesta en frecuencia.
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

Num = [0.2709   -0.1629   -0.4799    0.0000    0.4799    0.1629   -0.2709];       % Coeficientes del numerador filtro
Num = Num / 1000;
Den = [1.0000   -4.7288   10.2949  -12.8848    9.7755   -4.2638    0.8563];       % Coeficientes del denominador filtro

%% Grafico los resultados:

fig1 = figure(); set(fig1, 'Name', 'Ejercicio 4.7 Filtros IIR'); impz(Num, Den);
fig2 = figure(); set(fig2, 'Name', 'Ejercicio 4.7 Filtros IIR'); freqz(Num, Den);



