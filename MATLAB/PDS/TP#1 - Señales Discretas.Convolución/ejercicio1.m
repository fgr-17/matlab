%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #1 : Se�ales Discretas. Convoluci�n.
%
%   Script del Ejercicio N�1 : 
%
%   Escriba un programa en MatLab para generar las siguientes secuencias y 
%   graficarlas utilizando la funci�n stem: (a) Impulso discreto de 
%   Kronecker  d[n] ; (b) escal�n unitario u[n] y (c) rampa unitaria  
%   n*u[n ]. Los par�metros de entrada especificados por el usuario deben 
%   ser la longitud de datos deseada L y la frecuencia de muestreo fT en 
%   Hz. Usando este programa, genere las 100 primeras muestras de  cada una
%   de las secuencias mencionadas con una frecuencia de muestreo de 20 KHz. 
% 
%   Fecha de creaci�n   : 11-09-2010
%   �ltima Modificaci�n : 13-10-2010
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
N  = 100 ;          % cantidad de muestras a generar de cada se�al

%% S�ntesis de las se�ales

[d d_taxis] = Kronecker_Imp (fs, N) ;   % Genero impulso de Kronecker

[u u_taxis] = Escalon (fs, N) ;         % Genero se�al escal�n unitario

[r r_taxis] = Rampa (fs, N) ;           % Genero se�al rampa unitaria

%% Par�metros del gr�fico

NF = 3 ;        % Cantidad de filas del gr�fico
NC = 1 ;        % Cantidad de columnas del gr�fico

%% Gr�fico de las funciones

fig1 = figure() ;       % Genero handler de la figura

subplot(NF, NC, 1) ;        
PlotTiempo(d, d_taxis, 'Impulso discreto de Kronecker', 'd[n]', 'n', 1,'r') ;

subplot(NF, NC, 2) ;      
PlotTiempo(u, u_taxis, 'Escal�n unitario', 'u[n]', 'n', 1,'r') ;

subplot(NF, NC, 3) ;        
PlotTiempo(r, r_taxis, 'Rampa unitaria', 'n.u[n]', 'n', 1,'r') ;

set(fig1, 'Name', 'Ejercicio#1 : Se�ales' );

%% Almacenamiento de im�genes

saveas(fig1, [imagenesPath 'Ej1_senales.jpg']) ;