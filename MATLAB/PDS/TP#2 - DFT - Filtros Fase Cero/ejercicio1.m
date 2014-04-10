%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #2 : DFT. Filtros de Fase Cero
%
%   Script del Ejercicio N�1 : 
%
%   1.Implemente una rutina que calcule la Transformada de Fourier Discreta
%   (DFT) de una secuencia. Puede utilizar funciones predefinidas del 
%   MatLab. El par�metro de entrada debe ser la secuencia de datos y los 
%   par�metros de salida la Transformada. Esta rutina debe graficar M�dulo
%   y fase de la transformada o bien Parte real e Imaginaria de la misma.
%
%   Fecha de creaci�n   : 13-10-2010
%   �ltima Modificaci�n : 13-10-2010
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

addpath     ./imgOut ;     % directorio de almacenamiento de im�genes
addpath     ./fun ;       % directorio de almacenamiento de funciones

imagenesPath = './imgOut/' ;

%% Testeo de la funci�n implementada :

% La funci�n que se implement� seg�n lo pedido en el enunciado del
% ejercicio es '.\PlotFFT.m'. A continuaci�n se muestra su funcionamiento
% graficando el espectro de una se�al conocida, como puede ser una se�al
% senoidal. 

A       = 1 ;       % Amplitud de la se�al
delay_N = 32 ;      % Cantidad de muestras de delay para el cero de la se�al
Pe = 10.3 ;          % Cantidad de Per�odos a graficar
N = 256 ;           % Cantidad de Muestras de la se�al 

[signal timeAxis] = mySin_dig(A, delay_N ,Pe, N ) ;

titulo = 'Gr�fico temporal' ; 
xlab = 'n' ;
ylab = 'sin[n]' ;
mode = 0 ;
color = '-g' ;

img0 = PlotTiempo(signal, timeAxis, titulo, xlab, ylab, mode, color) ;

rotulo = sprintf('Gr�fico temporal de una se�al senoidal');
set(img0,'name',rotulo);

fs = 1 ;        % DFT con Ts = 1
mode = '.r' ;   % Color y s�mbolo para graficar

pol = 1 ;       % Grafico m�dulo y fase
[espectro img1 ] = PlotFFT( signal, fs, mode, pol, 1) ;
rotulo = sprintf('Gr�fico de m�dulo y fase de una se�al');
set(img1,'name',rotulo);

pol = 0 ;       % Grafico parte real e imaginaria
[espectro img2 ] = PlotFFT(signal, fs, mode, pol, 1) ;
rotulo = sprintf('Gr�fico Re/Im de una se�al');
set(img2,'name',rotulo);

%% Almacenamiento de im�genes

saveas(img0, [imagenesPath 'Ej1_Temporal.jpg']) ;
saveas(img1, [imagenesPath 'Ej1_Polar.jpg']) ;
saveas(img2, [imagenesPath 'Ej1_Cartesiano.jpg']) ;