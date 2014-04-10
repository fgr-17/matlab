%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Trabajo Práctico #2 : DFT. Filtros de Fase Cero
%
%   Script del Ejercicio N°3 : 
%
%   3.  Determine y grafique las parte real e imaginaria y  el espectro de 
%   magnitud y fase las siguientes Transformadas de Fourier: 
%
%   a) X(e^jw) = 0.0761 z^4 - 0.05806 z^2 + 0.0761
%                ---------------------------------
%                    z^4 + 1.355 z^2 + 0.619
%
%   b) X(e^jw) = 0.0518 z^3 - 0.1553 z^2 + 0.1553 z + 0.0518
%                -------------------------------------------
%                   z^3 + 1.282 z^2 + 1.039 z + 0.3418 
% 
%   Fecha de creación   : 14-09-2010
%   Última Modificación : 15-10-2010
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

addpath     ./imgOut ;    % directorio de almacenamiento de imágenes
addpath     ./fun ;       % directorio de almacenamiento de funciones

imagenesPath = './imgOut/' ;

%% Parámetros generales :

N = 256 ;       % Cantidad de puntos de recorte de la respuesta al impulso
fs = 1 ;        % Fijo Ts = 1 para tener TFSA

%% Ejercicio 3.a)

num1 = 0.0761*[1 0 -0.763 0 1];
den1 = [1 0 1.355 0 0.619] ;

H1 = tf(num1, den1, fs, 'q') ;

h1 = impz(num1, den1, N) ;

% Grafico polar y cartesiano :
[espectro img1] = PlotFFT( h1', fs, '-r', 1 ) ;
[espectro img2] = PlotFFT( h1', fs, '-r', 0 ) ;


%% Ejercicio 3.b)

num2 = [0.0518 -0.1553 0.1553 0.0518];
den2 = [1 1.282 1.0388 0.3418] ;

H2 = tf(num2, den2, 1, 'q') ;
h2 = impz(num2, den2, N) ;

% Grafico polar y cartesiano :
[espectro img1] = PlotFFT( h2', fs, '-r', 1 ) ;
[espectro img2] = PlotFFT( h2', fs, '-r', 0 ) ; 
