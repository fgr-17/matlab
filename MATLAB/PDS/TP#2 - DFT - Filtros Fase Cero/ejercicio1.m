%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Trabajo Práctico #2 : DFT. Filtros de Fase Cero
%
%   Script del Ejercicio N°1 : 
%
%   1.Implemente una rutina que calcule la Transformada de Fourier Discreta
%   (DFT) de una secuencia. Puede utilizar funciones predefinidas del 
%   MatLab. El parámetro de entrada debe ser la secuencia de datos y los 
%   parámetros de salida la Transformada. Esta rutina debe graficar Módulo
%   y fase de la transformada o bien Parte real e Imaginaria de la misma.
%
%   Fecha de creación   : 13-10-2010
%   Última Modificación : 13-10-2010
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

addpath     ./imgOut ;     % directorio de almacenamiento de imágenes
addpath     ./fun ;       % directorio de almacenamiento de funciones

imagenesPath = './imgOut/' ;

%% Testeo de la función implementada :

% La función que se implementó según lo pedido en el enunciado del
% ejercicio es '.\PlotFFT.m'. A continuación se muestra su funcionamiento
% graficando el espectro de una señal conocida, como puede ser una señal
% senoidal. 

A       = 1 ;       % Amplitud de la señal
delay_N = 32 ;      % Cantidad de muestras de delay para el cero de la señal
Pe = 10.3 ;          % Cantidad de Períodos a graficar
N = 256 ;           % Cantidad de Muestras de la señal 

[signal timeAxis] = mySin_dig(A, delay_N ,Pe, N ) ;

titulo = 'Gráfico temporal' ; 
xlab = 'n' ;
ylab = 'sin[n]' ;
mode = 0 ;
color = '-g' ;

img0 = PlotTiempo(signal, timeAxis, titulo, xlab, ylab, mode, color) ;

rotulo = sprintf('Gráfico temporal de una señal senoidal');
set(img0,'name',rotulo);

fs = 1 ;        % DFT con Ts = 1
mode = '.r' ;   % Color y símbolo para graficar

pol = 1 ;       % Grafico módulo y fase
[espectro img1 ] = PlotFFT( signal, fs, mode, pol, 1) ;
rotulo = sprintf('Gráfico de módulo y fase de una señal');
set(img1,'name',rotulo);

pol = 0 ;       % Grafico parte real e imaginaria
[espectro img2 ] = PlotFFT(signal, fs, mode, pol, 1) ;
rotulo = sprintf('Gráfico Re/Im de una señal');
set(img2,'name',rotulo);

%% Almacenamiento de imágenes

saveas(img0, [imagenesPath 'Ej1_Temporal.jpg']) ;
saveas(img1, [imagenesPath 'Ej1_Polar.jpg']) ;
saveas(img2, [imagenesPath 'Ej1_Cartesiano.jpg']) ;