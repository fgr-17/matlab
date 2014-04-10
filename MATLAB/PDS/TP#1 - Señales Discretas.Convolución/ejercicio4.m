%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc. Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #1 : Se�ales Discretas. Convoluci�n.
%
%   Script del Ejercicio N�4 :
%
%   Escriba un programa MatLab que grafique una se�al sinusoidal de tiempo 
%   continuo y su versi�n muestreada. Use la funci�n  hold  para mantener 
%   ambos resultados. Los par�metros de entrada deben ser la frecuencia de 
%   muestreo de la se�al, la longitud de la misma, valor pico de la 
%   senoidal, frecuencia de oscilaci�n y fase inicial. 
%
%   Fecha de creaci�n   : 22-09-2010
%   �ltima Modificaci�n : 22-09-2010
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

%% Implementaci�n del ejercicio :

A   = 1 ;               % Amplitud de la se�al
f0  = 3 ;              % Frecuencia fundamental de la se�al
ph0 = 0 ;               % Desfasaje de la se�al

N = 100 ;               % Cantidad de muestras a tomar
fs = 100 ;               % Frecuencia de muestreo 

[signal timeAxis] = mySinPlot (A, f0, ph0, N, fs) ;

