%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Trabajo Práctico #1 : Señales Discretas. Convolución.
%
%   Script del Ejercicio N°1 : 
%
%   Escriba un programa en MatLab para generar las siguientes secuencias y 
%   graficarlas utilizando la función stem: (a) Impulso discreto de 
%   Kronecker  d[n] ; (b) escalón unitario u[n] y (c) rampa unitaria  
%   n*u[n ]. Los parámetros de entrada especificados por el usuario deben 
%   ser la longitud de datos deseada L y la frecuencia de muestreo fT en 
%   Hz. Usando este programa, genere las 100 primeras muestras de  cada una
%   de las secuencias mencionadas con una frecuencia de muestreo de 20 KHz. 
% 
%   Fecha de creación   : 11-09-2010
%   Última Modificación : 13-10-2010
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
N  = 100 ;          % cantidad de muestras a generar de cada señal

%% Síntesis de las señales

[d d_taxis] = Kronecker_Imp (fs, N) ;   % Genero impulso de Kronecker

[u u_taxis] = Escalon (fs, N) ;         % Genero señal escalón unitario

[r r_taxis] = Rampa (fs, N) ;           % Genero señal rampa unitaria

%% Parámetros del gráfico

NF = 3 ;        % Cantidad de filas del gráfico
NC = 1 ;        % Cantidad de columnas del gráfico

%% Gráfico de las funciones

fig1 = figure() ;       % Genero handler de la figura

subplot(NF, NC, 1) ;        
PlotTiempo(d, d_taxis, 'Impulso discreto de Kronecker', 'd[n]', 'n', 1,'r') ;

subplot(NF, NC, 2) ;      
PlotTiempo(u, u_taxis, 'Escalón unitario', 'u[n]', 'n', 1,'r') ;

subplot(NF, NC, 3) ;        
PlotTiempo(r, r_taxis, 'Rampa unitaria', 'n.u[n]', 'n', 1,'r') ;

set(fig1, 'Name', 'Ejercicio#1 : Señales' );

%% Almacenamiento de imágenes

saveas(fig1, [imagenesPath 'Ej1_senales.jpg']) ;