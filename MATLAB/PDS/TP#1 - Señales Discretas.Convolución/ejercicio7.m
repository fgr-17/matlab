%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Trabajo Práctico #1 : Señales Discretas. Convolución.
%
%   Script del Ejercicio N°7 : 
%
%   7.Implementar un programa que calcule la convolución discreta de dos 
%   señales discretas (adquiridas o implementadas) y muestre el resultado 
%   en pantalla. Corrobore sus resultados convolucionando respuestas al 
%   impulso típicas de filtros pasabajos, e.g filtro RC cuya entrada sea un
%   pulso rectangular. 
% 
%   Fecha de creación   : 13-10-2010
%   Última Modificación : 13-10-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

%% Introducción :

% En éste ejercicio se realizará la convolución de una señal adquirida y
% una versión discreta de un filtro pasabajos analógicos, discretizado
% mediante la transformada bilineal.

%% Inicialización del script

clc ;           % Limpio el Command Window
close all ;     % Cierro todas las ventanas
clear all ;     % Limpio variables del Workspace

addpath     ./imagenesOut ;     % directorio de almacenamiento de imágenes
addpath     ./funciones ;       % directorio de almacenamiento de funciones
addpath     ./signalsIn ;       % directorio de almacenamiento de señales

imagenesPath = './imagenesOut/';

%% Discretización del filtro analógico

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
% frecuencia de muestreo a la que fue adquirida la señal.

Fs = 1e3 ;          % La señal fue adquirida a 1kHz

% La transformada bilineal se implementa mediante la función 'bilinear' :

[B A] = bilinear(N, D, Fs) ;

% Para poder realizar la convolución entre la señal adquirida y el filtro
% recién implementado, necesito la respuesta al impulso del filtro. Como se
% trata de un filtro con respuesta al impulso infinita (IIR) necesito tomar
% una cierta cantidad de muestras. En éste caso, 100 :

[h t] = impz(B, A, 100 ) ;

%% Adquisición de la señal a filtrar :

load('registro#13.mat') ;       % Levanto en memoria la señal a procesar

% Como es una señal muy extensa, solo me quedo con algunas muestras de la
% misma para procesar :

n0 = 1.44e4 ;       % Muestra inicial 
nf = 1.6e4 ;        % Muestra final

data = data(n0:nf , 1)' ;    % Señal recortada (traspongo por comodidad)

%% Filtrado de la señal :

data_f = conv(data, h) ;    % Realizo la convolución entre las 2 señales

%% Eje temporal de las señales

Ts = 1/Fs ;     % Recupero el período de muestreo de la señal

L_f = size(data_f ,2) ;     % Largo de la señal filtrada
L = size(data, 2) ;         % Largo de la señal sin filtrar

n0 = 0 ;                    % Muestra inicial de la señal sin filtrar
nf = (L - 1) ;              % Muestra final de la señal sin filtrar
n_axis = n0:nf ;            % Eje de número de muestras de la señal sin filtrar
t_axis = n_axis * Ts ;      % Eje temporal de la señal sin filtrar

n0_f = 0 ;                  % Muestra inicial de la señal filtrada
nf_f = (L_f - 1) ;          % Muestra final de la señal filtrada
nf_axis = n0:nf_f ;         % Eje de número de muestras de la señal filtrada
tf_axis = nf_axis * Ts ;    % Eje temporal de la señal filtrada

%% Gráficos de salida de las señales :

NF = 3 ;            % Cantidad de filas del gráfico
NC = 1 ;            % Cantidad de columnas del gráfico

fig1 = figure ();

subplot(NF, NC, 1) ;
PlotTiempo(h, t, 'Respuesta al impulso del filtro', 't', 'h(t)', 1, 'r') ;

subplot(NF, NC, 2) ;
PlotTiempo(data, n_axis, 'Señal sin filtrar','t', 's(t)',  0, '.r') ;

subplot(NF, NC, 3) ;
PlotTiempo(data_f, nf_axis, 'Señal Filtrada', 't', 's_f(t)', 0, '.r') ;


%% Almacenamiento de imágenes

saveas(fig1, [imagenesPath 'Ej7_filtro.jpg']) ;