%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #1 : Se�ales Discretas. Convoluci�n.
%
%   Script del Ejercicio N�5 : 
%
%   Utilizando la funci�n  impz, escriba un programa en MatLab que calcule
%   y grafique la respuesta al impulso de un sistema de tiempo discreto 
%   lineal e invariante al desplazamiento. Los datos de entrada al programa
%   son la longitud deseada de la respuesta al impulso y las constantes de 
%   la ecuaci�n en diferencias {dk} y {pk}. Utilice como ejemplo, la 
%   siguiente ecuaci�n en diferencias: 
%
%   y[n] + 0.7*y[n-1] - 0.45*y[n-2] - 0.6*y[n-3] =
%   0.8*x[n] - 0.44*x[n-1] + 0.16*x[n-2] + 0.02*x[n-3]
%
%   Recuerde que Todo sistema lineal e invariante al desplazamiento, est� 
%   caracterizado por una ecuaci�n en diferencias lineal, a coeficientes 
%   constantes, de orden N, como se indica a continuaci�n:  
% 
%       Sum{dk*y[n-k]} = Sum{pk*x[n-k]}
% 
%   Fecha de creaci�n   : 14-09-2010
%   �ltima Modificaci�n : 14-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------


%% Inicializaci�n del script : 

clc ;           % Limpio el Command Window
close all ;     % Cierro todas las ventanas
clear all ;     % Limpio variables del Workspace

addpath     ./imagenesOut ;     % directorio de almacenamiento de im�genes
addpath     ./funciones ;       % directorio de almacenamiento de funciones

imagenesPath = './imagenesOut/';

%% Implementaci�n del algoritmo : 

d = [1 0.7 -0.45 -0.6] ;    % Array de coeficientes inversos

p = [0.8 -0.44 0.16 0.02] ; % Array de coeficientes directos

N = 50 ;

[H T] = impz(p, d, N) ;

stem (T, H) ;


