%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc. Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #1 : Se�ales Discretas. Convoluci�n.
%
%   Script del Ejercicio N�3 :
%
%   3.  Escriba un algoritmo MatLab que genere una secuencia senoidal  
%   x[n] =A cos (w0*n+phi) y grafique la secuencia con el comando stem. Los 
%   datos de entrada a ser especificados por el usuario son la longitud 
%   deseada L, la amplitud A, el �ngulo discreto w0*n  y la fase phi ,donde  
%   0 < w0 < pi y  0 < phi < 2*pi . 
%
%   Fecha de creaci�n   : 22-09-2010
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

%% Implementaci�n del algoritmo :

% La funci�n realizada para �ste ejercicio es '.\funciones\myCos.m' :

A = 1 ;         % Amplitud de la se�al
f0 = 1 ;        % Frecuencia discreta
fs = 50 ;       % Frecuencia de muestreo

w0 = 2*pi*f0/fs ;  % �ngulo discreto

L = 100 ;       % Cantidad de muestras a generar
ph0 = pi/6 ;    % Desfasaje inicial

sgn  = myCos (L, A, w0, ph0) ;
