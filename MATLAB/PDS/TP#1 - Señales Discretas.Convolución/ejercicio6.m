%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Trabajo Práctico #1 : Señales Discretas. Convolución.
%
%   Script del Ejercicio N°6 : 
%
%   6.  Implementar en forma digital y visualizar, las siguientes señales 
%   continuas: 
% 
%       Seno
%       Pulso
%       Amplitud Modulada
%       Exponencial
%       Frecuencia Modulada
%       Delta de Dirac
%       Función Sampling (Sinc)
%       Amortiguada
%
%   Hint: Trabaje con un número fijo de muestras y que sea múltiplo de 
%   2 (128, 256, 512, 1024, etc.) que servirá para trabajos futuros. 
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

%% Definición de parámetros :

fs = 100 ;          % Frecuencia de muestreo fs = 100 Hz
N = 182 ;          % Cantidad de muestras a generar N = 1024

%% Síntesis de las señales 

% ---------------------------------------------
%               Señal senoidal:
% ---------------------------------------------

A = 2 ;             % Amplitud de la señal
f0 = 1 ;            % Frecuencia fundamental de la señal 10 Hz
ph0 = 0 ;           % Fase de la señal = 0 rad

[sig t] = mySin (A, f0, ph0, N, fs) ;   % Genero la señal

PlotTiempo(sig, t, 'Señal senoidal',  't','sin(t)', 1, 'r') ;
pause ;

% ---------------------------------------------
%               Señal Pulso:
% ---------------------------------------------


A = 3 ;             % Amplitud del pulso
t0 = 0 ;            % Instante inicial del pulso
t1 = 0.21 ;          % Instante final del pulso

[sig t] = myPulse(A ,t0 ,t1 ,N , fs) ;

PlotTiempo (sig, t, 'Pulso', 't', 'u(t-t0)-u(t-t1)', 1, 'r' ) ;
pause ;

% ---------------------------------------------
%          Señal Amplitud Modulada:
% ---------------------------------------------

Am = 0.1 ;          % Amplitud de la señal modulante
Ac = 1 ;            % Amplitud de la portadora
fm = 1 ;            % Frecuencia de la modulante 0.1 Hz
fc = 5;             % Frecuencia de la portadora 2 Hz

[sig t ] = myAM( Am, Ac, fm, fc, N, fs ) ;

PlotTiempo ( sig, t, 'Amplitud Modulada', 't', 'Modulación AM', 1, 'r' ) ;
pause ;

% ---------------------------------------------
%           Señal Exponencial
% ---------------------------------------------

A = 1 ;             % Amplitud de la señal
t0 = 0.5 ;          % Instante inicial de la señal
alpha = -2 ;        % tao = 1 seg

[signal timeAxis] = myExp(A ,t0 ,alpha ,N , fs) ;
PlotTiempo ( signal, timeAxis, 'Señal Exponencial', 't', 'A.exp(alpha.t)', 1, 'r' ) ;
pause ;
% ---------------------------------------------
%          Señal Frecuencia Modulada
% ---------------------------------------------

Am = pi/2 ;             % Amplitud de la modulante
Ac = 1 ;                % Amplitud de la portadora

fm = 2 ;                % Frecuencia de la modulante
fc = 5 ;                % Frecuencia de la portadora

[signal timeAxis] = myFM( Am, Ac, fm, fc, N, fs ) ;
PlotTiempo ( signal, timeAxis, 'Frecuencia Modulada', 't', 'Modulación en frecuencia', 1, 'r' ) ;

pause ;

% ---------------------------------------------
%          Señal Delta de Dirac
% ---------------------------------------------

A = 6 ;                 % Amplitud de la señal
t0 = 3.2 ;              % Instante inicial de la señal

[signal timeAxis] = myDelta( A, t0, N, fs ) ;
PlotTiempo ( signal, timeAxis, 'Delta de Dirac', 't', 'd(t-t0)', 1, 'r' ) ;

pause ;

% ---------------------------------------------
%               Señal Sampling
% ---------------------------------------------

A = 2 ;                 % Amplitud de la señal
f0 = 10 ;               % Frecuencia fundamental de la señal
t0 = 1.3 ;              % Retardo de la señal

[signal timeAxis] = mySinc( A, f0, t0 ,N , fs) ;
PlotTiempo ( signal, timeAxis, 'Funcion Sampling', 't', 'sinc(w0*(t-t0))', 1, 'r' ) ;

pause ;
% ---------------------------------------------
%            Señal Subamortiguada
% ---------------------------------------------

A = 1 ;                 % Amplitud de la señal
f0 = 5 ;                % Frecuencia fundamental de la señal
alpha = 1/2 ;           % Tao = 2 s

[signal timeAxis] = mySubamort( A, f0, alpha ,N , fs) ;
PlotTiempo (signal, timeAxis, 'Funcion Subamortiguada', 't', 'SubAmortiguamiento', 1, 'r' ) ;

pause ;

