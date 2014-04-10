%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #1 : Se�ales Discretas. Convoluci�n.
%
%   Script del Ejercicio N�7 : 
%
%   7.Implementar un programa que calcule la convoluci�n discreta de dos 
%   se�ales discretas (adquiridas o implementadas) y muestre el resultado 
%   en pantalla. Corrobore sus resultados convolucionando respuestas al 
%   impulso t�picas de filtros pasabajos, e.g filtro RC cuya entrada sea un
%   pulso rectangular. 
% 
%   Fecha de creaci�n   : 13-10-2010
%   �ltima Modificaci�n : 13-10-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

%% Introducci�n :

% En �ste ejercicio se realizar� la convoluci�n de una se�al adquirida y
% una versi�n discreta de un filtro pasabajos anal�gicos, discretizado
% mediante la transformada bilineal.

%% Inicializaci�n del script

clc ;           % Limpio el Command Window
close all ;     % Cierro todas las ventanas
clear all ;     % Limpio variables del Workspace

addpath     ./imagenesOut ;     % directorio de almacenamiento de im�genes
addpath     ./funciones ;       % directorio de almacenamiento de funciones
addpath     ./signalsIn ;       % directorio de almacenamiento de se�ales

imagenesPath = './imagenesOut/';

%% Discretizaci�n del filtro anal�gico

% Es conocida la transferencia en laplace de un filtro pasivo pasabajos RC.
% Esta puede escribirse como sigue :

% R = 1 ;             % Valor de la resistencia en Ohms
% C = 0.1e-6 ;        % Valor del capacitor en Faradios
% fc = 1/(2*pi*R*C ) ;% Frecuencia de corte del filtro

fc = 150 ;               % Frecuencia de corte en Hertz
wc = 2*pi*fc ;

s = tf('s') ;           % Defino la variable de transferencia en Laplace

Hs = wc/(s + wc) ;      % Transferencia del filtro en el dominio de Laplace

% Podemos ver que los coeficientes del filtro son : 

N = [wc] ;          % Coeficientes del numerador
D = [1 wc] ;        % Coeficientes del denominador

% Para implementar la transformada bilineal es necesario determinar la
% frecuencia de muestreo a la que fue adquirida la se�al.

Fs = 1e3 ;          % La se�al fue adquirida a 1kHz

% La transformada bilineal se implementa mediante la funci�n 'bilinear' :

[B A] = bilinear(N, D, Fs) ;

% Para poder realizar la convoluci�n entre la se�al adquirida y el filtro
% reci�n implementado, necesito la respuesta al impulso del filtro. Como se
% trata de un filtro con respuesta al impulso infinita (IIR) necesito tomar
% una cierta cantidad de muestras. En �ste caso, 100 :

[h t] = impz(B, A, 100 ) ;

%% Adquisici�n de la se�al a filtrar :

load('registro#13.mat') ;       % Levanto en memoria la se�al a procesar

% Como es una se�al muy extensa, solo me quedo con algunas muestras de la
% misma para procesar :

n0 = 1.44e4 ;       % Muestra inicial 
nf = 1.6e4 ;        % Muestra final

data = data(n0:nf , 1)' ;    % Se�al recortada (traspongo por comodidad)

%% Filtrado de la se�al :

data_f = conv(data, h) ;    % Realizo la convoluci�n entre las 2 se�ales

%% Eje temporal de las se�ales

Ts = 1/Fs ;     % Recupero el per�odo de muestreo de la se�al

L_f = size(data_f ,2) ;     % Largo de la se�al filtrada
L = size(data, 2) ;         % Largo de la se�al sin filtrar

n0 = 0 ;                    % Muestra inicial de la se�al sin filtrar
nf = (L - 1) ;              % Muestra final de la se�al sin filtrar
n_axis = n0:nf ;            % Eje de n�mero de muestras de la se�al sin filtrar
t_axis = n_axis * Ts ;      % Eje temporal de la se�al sin filtrar

n0_f = 0 ;                  % Muestra inicial de la se�al filtrada
nf_f = (L_f - 1) ;          % Muestra final de la se�al filtrada
nf_axis = n0:nf_f ;         % Eje de n�mero de muestras de la se�al filtrada
tf_axis = nf_axis * Ts ;    % Eje temporal de la se�al filtrada

%% Gr�ficos de salida de las se�ales :

NF = 3 ;            % Cantidad de filas del gr�fico
NC = 1 ;            % Cantidad de columnas del gr�fico

fig1 = figure ();

subplot(NF, NC, 1) ;
PlotTiempo(h, t, 'Respuesta al impulso del filtro', 't', 'h(t)', 1, 'r') ;

subplot(NF, NC, 2) ;
PlotTiempo(data, n_axis, 'Se�al sin filtrar','t', 's(t)',  0, '.r') ;

subplot(NF, NC, 3) ;
PlotTiempo(data_f, nf_axis, 'Se�al Filtrada', 't', 's_f(t)', 0, '.r') ;


%% Almacenamiento de im�genes

saveas(fig1, [imagenesPath 'Ej7_filtro.jpg']) ;