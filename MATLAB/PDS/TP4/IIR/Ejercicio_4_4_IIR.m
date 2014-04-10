% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_4_4_IIR.m
%
%   Enunciado:  4. Dise�e un filtro Pasa Bajos Butterworth IIR suponiendo 
%   que se requiere que la banda de paso sea constante dentro de 1 dB para 
%   frecuencias por debajo de 100 Hz y que la banda de atenuaci�n sea mayor
%   que 15 dB para frecuencias superiores a 150 Hz (se recomienda utilizar 
%   MatLab para obtener la funci�n de transferencia del filtro pedido).La 
%   frecuencia de muestreo que se utiliza para el dise�o del filtro es de 1 
%   KHz. Verifique su dise�o graficando la respuesta al impulso del filtro 
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

Num = [0.0002    0.0012    0.0037    0.0062    0.0062    0.0037    0.0012    0.0002];       % Coeficientes del numerador filtro
Den = [1.0000   -3.8471    6.7860   -6.9629    4.4452   -1.7542    0.3944   -0.0388];       % Coeficientes del denominador filtro

%% Grafico los resultados:

NF = 2;
NC = 2;

fig1 = figure(); set(fig1, 'Name', 'Ejercicio 4.4 Filtros IIR'); impz(Num, Den);
fig2 = figure(); set(fig2, 'Name', 'Ejercicio 4.4 Filtros IIR'); freqz(Num, Den);
