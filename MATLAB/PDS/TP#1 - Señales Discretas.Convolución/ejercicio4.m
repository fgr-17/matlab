%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc. Ing. Franco Martín Pessana
%
%   Trabajo Práctico #1 : Señales Discretas. Convolución.
%
%   Script del Ejercicio N°4 :
%
%   Escriba un programa MatLab que grafique una señal sinusoidal de tiempo 
%   continuo y su versión muestreada. Use la función  hold  para mantener 
%   ambos resultados. Los parámetros de entrada deben ser la frecuencia de 
%   muestreo de la señal, la longitud de la misma, valor pico de la 
%   senoidal, frecuencia de oscilación y fase inicial. 
%
%   Fecha de creación   : 22-09-2010
%   Última Modificación : 22-09-2010
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

%% Implementación del ejercicio :

A   = 1 ;               % Amplitud de la señal
f0  = 3 ;              % Frecuencia fundamental de la señal
ph0 = 0 ;               % Desfasaje de la señal

N = 100 ;               % Cantidad de muestras a tomar
fs = 100 ;               % Frecuencia de muestreo 

[signal timeAxis] = mySinPlot (A, f0, ph0, N, fs) ;

