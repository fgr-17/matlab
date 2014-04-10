%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #1 : Se�ales Discretas. Convoluci�n.
%
%   Script del Ejercicio N�2 : 
%
%   Utilizando las funciones sawtooth y square, escriba un programa para 
%   generar 2 se�ales peri�dicas (diente de sierra y cuadrada) y 
%   graf�quelas utilizando la funci�n MatLab stem. Los datos de entrada a 
%   ser especificados por el usuario son la longitud deseada de las 
%   secuencias L, el valor pico A y el per�odo N. Para el caso de la onda 
%   cuadrada, se puede especificar un par�metro adicional que es el ciclo 
%   de trabajo, que es el porcentaje del tiempo en el que la se�al es 
%   positiva. Usando este programa, genere las 100 primeras muestras de 
%   ambas secuencias, con una frecuencia de muestreo de 20 kHz, un valor 
%   pico de 7, un per�odo de 13 segundos y para la se�al cuadrada, un ciclo
%   de trabajo del 60%.
%
%   Fecha de creaci�n : 11-09-2010
%   �ltima Modificaci�n : 11-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

%% Inicializaci�n del script

clc ;           % Limpio el Command Window
close all ;     % Cierro todas las ventanas
clear all ;     % Limpio variables del Workspace

addpath     ./imagenesOut ;     % directorio de almacenamiento de im�genes
addpath     ./funciones ;       % directorio de almacenamiento de funciones

imagenesPath = './imagenesOut/';

%% Seteo de par�metros

fs = 20e3 ;         % seteo la frecuencia de sampleo en 20 kHz
L  = 100 ;          % cantidad de muestras a generar de cada se�al
Vp = 7 ;            % Valor pico de las se�ales
T = 13 ;            % Per�odo de las se�ales [s]
duty = 60 ;         % Ciclo de trabajo de la se�al cuadrada [%]

%% S�ntesis de las se�ales

[s s_taxis] = D_sierra (L, Vp, T, fs) ;         % Se�al Dientes de Sierra

[q q_taxis] = Cuadrada (L, Vp, T, duty,fs) ;	% Se�al Cuadrada

%% Par�metros del gr�fico

NF = 2 ;        % Cantidad de filas del gr�fico
NC = 1 ;        % Cantidad de columnas del gr�fico

%% Gr�fico de las funciones

fig1 = figure() ;       % Genero handler de la figura

subplot(NF, NC, 1) ;        
PlotTiempo(s, s_taxis, 'Dientes de Sierra T = 13s', 'sawtooth[n]', 'n', 1, 'r') ;

subplot(NF, NC, 2) ;      
PlotTiempo(q, q_taxis, 'Cuadrada T = 13s duty = 60%', 'square[n]', 'n', 1, 'r') ;

set(fig1, 'Name', 'Ejercicio#2 : Se�ales' ) ;

%% Almacenamiento de im�genes

saveas(fig1, [imagenesPath 'Ej2_senales.jpg']) ;