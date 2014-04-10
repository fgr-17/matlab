%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Trabajo Práctico #1 : Señales Discretas. Convolución.
%
%   Script del Ejercicio N°2 : 
%
%   Utilizando las funciones sawtooth y square, escriba un programa para 
%   generar 2 señales periódicas (diente de sierra y cuadrada) y 
%   grafíquelas utilizando la función MatLab stem. Los datos de entrada a 
%   ser especificados por el usuario son la longitud deseada de las 
%   secuencias L, el valor pico A y el período N. Para el caso de la onda 
%   cuadrada, se puede especificar un parámetro adicional que es el ciclo 
%   de trabajo, que es el porcentaje del tiempo en el que la señal es 
%   positiva. Usando este programa, genere las 100 primeras muestras de 
%   ambas secuencias, con una frecuencia de muestreo de 20 kHz, un valor 
%   pico de 7, un período de 13 segundos y para la señal cuadrada, un ciclo
%   de trabajo del 60%.
%
%   Fecha de creación : 11-09-2010
%   Última Modificación : 11-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

%% Inicialización del script

clc ;           % Limpio el Command Window
close all ;     % Cierro todas las ventanas
clear all ;     % Limpio variables del Workspace

addpath     ./imagenesOut ;     % directorio de almacenamiento de imágenes
addpath     ./funciones ;       % directorio de almacenamiento de funciones

imagenesPath = './imagenesOut/';

%% Seteo de parámetros

fs = 20e3 ;         % seteo la frecuencia de sampleo en 20 kHz
L  = 100 ;          % cantidad de muestras a generar de cada señal
Vp = 7 ;            % Valor pico de las señales
T = 13 ;            % Período de las señales [s]
duty = 60 ;         % Ciclo de trabajo de la señal cuadrada [%]

%% Síntesis de las señales

[s s_taxis] = D_sierra (L, Vp, T, fs) ;         % Señal Dientes de Sierra

[q q_taxis] = Cuadrada (L, Vp, T, duty,fs) ;	% Señal Cuadrada

%% Parámetros del gráfico

NF = 2 ;        % Cantidad de filas del gráfico
NC = 1 ;        % Cantidad de columnas del gráfico

%% Gráfico de las funciones

fig1 = figure() ;       % Genero handler de la figura

subplot(NF, NC, 1) ;        
PlotTiempo(s, s_taxis, 'Dientes de Sierra T = 13s', 'sawtooth[n]', 'n', 1, 'r') ;

subplot(NF, NC, 2) ;      
PlotTiempo(q, q_taxis, 'Cuadrada T = 13s duty = 60%', 'square[n]', 'n', 1, 'r') ;

set(fig1, 'Name', 'Ejercicio#2 : Señales' ) ;

%% Almacenamiento de imágenes

saveas(fig1, [imagenesPath 'Ej2_senales.jpg']) ;