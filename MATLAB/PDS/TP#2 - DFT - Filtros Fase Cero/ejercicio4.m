%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #2 : DFT. Filtros de Fase Cero
%
%   Script del Ejercicio N�4 : 
%
%   4.  Implementar en forma digital y visualizar los resultados de las 
%   se�ales filtradas con los siguientes filtros de fase cero: 
%   
%   a) Pasabajos con corte en w1
%   b) Eliminabanda con corte en w1 y w2
%   c) Pasaaltos con corte en w1
%   d) Pasabanda con corte en w1 y w2
% 
%   Fecha de creaci�n   : 15-10-2010
%   �ltima Modificaci�n : 15-10-2010
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

addpath     ./imgOut ;    % directorio de almacenamiento de im�genes
addpath     ./fun ;       % directorio de almacenamiento de funciones

imagenesPath = './imgOut/' ;

%% Par�metros generales

NF = 3 ;        % Cantidad de filas del gr�fico
NC = 1 ;        % Cantidad de columnas del gr�fico

fs = 1e3 ;      % Frecuencia de muestreo

%   NOTA : como los 4 �tems del ejercicio son iguales pero con diferentes
%   formas del filtro, opt� por tener un �nico script en el que se
%   modifique el filtro a utilizar a partir del par�metro seteado con la
%   variable 'ejercicio'. 

ejercicio = 'b' ;

%% S�ntesis del filtro

switch(ejercicio)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 'a'    % Ejercicio 4.a ) Pasabajos con corte en f1

% El usuario ingresa por teclado la frecuencia de corte del LPF
[f1 ] = Paramet ( 'Filtro Pasa bajos', 'Frecuencia de corte' ) ;
% f1 = 150 ;

Nf = 128 ;                      % Cantidad de muestras del filtro
wc = (f1 / fs) * (2 * pi) ;     % �ngulo discreto de corte

[h H] = pasabajos_ideal( wc, Nf) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 'b'    % Ejercicio 4.b ) Eliminabanda con corte en w1 y w2
        
[f1 f2] = Paramet ( 'Filtro Eliminabanda', 'fc1', 'fc2' ) ;
% f1 = 150 ;

Nf = 128 ;                      % Cantidad de muestras del filtro

wc1 = (f1 / fs) * (2 * pi) ;     % �ngulo discreto de corte
wc2 = (f2 / fs) * (2 * pi) ;     % �ngulo discreto de corte

[h H] = eliminabanda_ideal( wc1, wc2, Nf) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 'c'    % Ejercicio 4.c ) Pasaaltos con corte en w1

[f1 ] = Paramet ( 'Filtro Pasa altos', 'Frecuencia de corte' ) ;
% f1 = 150 ;

Nf = 128 ;                      % Cantidad de muestras del filtro
wc = (f1 / fs) * (2 * pi) ;     % �ngulo discreto de corte

[h H] = pasaaltos_ideal( wc, Nf) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    case 'd'    % Ejercicio 4.d ) Pasabanda con corte en w1 y w2
                
[f1 f2] = Paramet ( 'Filtro Pasabanda', 'fc1', 'fc2' ) ;
% f1 = 150 ;

Nf = 128 ;                      % Cantidad de muestras del filtro

wc1 = (f1 / fs) * (2 * pi) ;     % �ngulo discreto de corte
wc2 = (f2 / fs) * (2 * pi) ;     % �ngulo discreto de corte

[h H] = pasabanda_ideal( wc1, wc2, Nf) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
    otherwise
        
        disp('setear la variable "ejercicio" a un valor entre a y d') ;
        return
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
modo = '-r' ;                   % Grafico con puntos rojos
polar = 1 ;                     % Grafico m�dulo y fase del filtro

[spect img0 ] = PlotFFT(h , fs, modo, polar ) ;
set(img0, 'Name', 'Espectro del filtro ' );

%%  Sintesis de la se�al a filtrar

L = 128 ;
A = 1 ;
N = 30 ;
duty = 70 ;

[x t] = Cuadrada(L, A, N, duty, fs) ;

% Ajustado al largo del filtro Nf con zero padding o truncamiento

X = fft(x, Nf) ;        

img1 = figure() ;
subplot ( NF, NC, 1) ;

titulo = 'Se�al sin filtrar' ;
xlab = 't' ;
ylab = 'square(t)' ;
mode = 0 ;
color = '.g' ;

PlotTiempo(x, t, titulo, xlab, ylab, mode, color) ;

[spect img2 ] = PlotFFT(x , fs, '', polar ) ;
set(img2, 'Name', 'Espectro de la se�al sin filtrar' );

%%  Filtrado de la se�al : 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% a) filtrado por producto de los espectros :
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Y1 = X .* H ;    % Espectro de la se�al filtrara

y1 = real(ifft (Y1 )) ;

% Eje temporal de la se�al filtrada

Ts = 1/fs ;                 % Recupero el per�odo de muestreo de la se�al

L_f = size(y1 ,2) ;         % Largo de la se�al filtrada

n0_f = 0 ;                  % Muestra inicial de la se�al filtrada
nf_f = (L_f - 1) ;          % Muestra final de la se�al filtrada
nf_axis = n0_f:nf_f ;       % Eje de n�mero de muestras de la se�al filtrada
tf_axis = nf_axis * Ts ;    % Eje temporal de la se�al filtrada


[spect img3 ] = PlotFFT(y1 , fs, '', polar ) ;
set(img3, 'Name', 'Espectro de la se�al filtrada por producto de espectros' );

figure(img1) ;
subplot(NF, NC, 2) ;

titulo = 'Se�al filtrada por producto de espectros' ;
PlotTiempo(y1, tf_axis, titulo, xlab, ylab, mode, color) ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% b) filtrado por convoluci�n de la se�al con h[n]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y2 = Filtrar_Fase_Cero(h, 1, x);      % Filtro con el 1er m�todo

% Eje temporal de la se�al

Ts = 1/fs ;                 % Recupero el per�odo de muestreo de la se�al

L_f = size(y2 ,2) ;         % Largo de la se�al filtrada

n0_f = 0 ;                  % Muestra inicial de la se�al filtrada
nf_f = (L_f - 1) ;          % Muestra final de la se�al filtrada
nf_axis = n0_f:nf_f ;       % Eje de n�mero de muestras de la se�al filtrada
tf_axis = nf_axis * Ts ;    % Eje temporal de la se�al filtrada

figure(img1) ;
subplot(NF, NC, 3) ;
titulo = 'Se�al filtrada por convoluci�n' ;
PlotTiempo(y2, tf_axis, titulo, xlab, ylab, mode, color) ;

[spect img4 ] = PlotFFT(y2 , fs, '', polar ) ;
set(img4, 'Name', 'Espectro de la se�al filtrada por convoluci�n' );