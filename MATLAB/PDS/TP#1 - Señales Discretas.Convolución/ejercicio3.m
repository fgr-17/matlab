%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc. Ing. Franco Martín Pessana
%
%   Trabajo Práctico #1 : Señales Discretas. Convolución.
%
%   Script del Ejercicio N°3 :
%
%   3.  Escriba un algoritmo MatLab que genere una secuencia senoidal  
%   x[n] =A cos (w0*n+phi) y grafique la secuencia con el comando stem. Los 
%   datos de entrada a ser especificados por el usuario son la longitud 
%   deseada L, la amplitud A, el ángulo discreto w0*n  y la fase phi ,donde  
%   0 < w0 < pi y  0 < phi < 2*pi . 
%
%   Fecha de creación   : 22-09-2010
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

%% Implementación del algoritmo :

% La función realizada para éste ejercicio es '.\funciones\myCos.m' :

A = 1 ;         % Amplitud de la señal
f0 = 1 ;        % Frecuencia discreta
fs = 50 ;       % Frecuencia de muestreo

w0 = 2*pi*f0/fs ;  % Ángulo discreto

L = 100 ;       % Cantidad de muestras a generar
ph0 = pi/6 ;    % Desfasaje inicial

sgn  = myCos (L, A, w0, ph0) ;
