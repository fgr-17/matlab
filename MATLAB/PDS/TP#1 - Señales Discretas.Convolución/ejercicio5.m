%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Trabajo Práctico #1 : Señales Discretas. Convolución.
%
%   Script del Ejercicio N°5 : 
%
%   Utilizando la función  impz, escriba un programa en MatLab que calcule
%   y grafique la respuesta al impulso de un sistema de tiempo discreto 
%   lineal e invariante al desplazamiento. Los datos de entrada al programa
%   son la longitud deseada de la respuesta al impulso y las constantes de 
%   la ecuación en diferencias {dk} y {pk}. Utilice como ejemplo, la 
%   siguiente ecuación en diferencias: 
%
%   y[n] + 0.7*y[n-1] - 0.45*y[n-2] - 0.6*y[n-3] =
%   0.8*x[n] - 0.44*x[n-1] + 0.16*x[n-2] + 0.02*x[n-3]
%
%   Recuerde que Todo sistema lineal e invariante al desplazamiento, está 
%   caracterizado por una ecuación en diferencias lineal, a coeficientes 
%   constantes, de orden N, como se indica a continuación:  
% 
%       Sum{dk*y[n-k]} = Sum{pk*x[n-k]}
% 
%   Fecha de creación   : 14-09-2010
%   Última Modificación : 14-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------


%% Inicialización del script : 

clc ;           % Limpio el Command Window
close all ;     % Cierro todas las ventanas
clear all ;     % Limpio variables del Workspace

addpath     ./imagenesOut ;     % directorio de almacenamiento de imágenes
addpath     ./funciones ;       % directorio de almacenamiento de funciones

imagenesPath = './imagenesOut/';

%% Implementación del algoritmo : 

d = [1 0.7 -0.45 -0.6] ;    % Array de coeficientes inversos

p = [0.8 -0.44 0.16 0.02] ; % Array de coeficientes directos

N = 50 ;

[H T] = impz(p, d, N) ;

stem (T, H) ;


