%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #1 : Se�ales Discretas. Convoluci�n.
%
%   Script del Ejercicio N�6 : 
%
%   6.  Implementar en forma digital y visualizar, las siguientes se�ales 
%   continuas: 
% 
%       Seno
%       Pulso
%       Amplitud Modulada
%       Exponencial
%       Frecuencia Modulada
%       Delta de Dirac
%       Funci�n Sampling (Sinc)
%       Amortiguada
%
%   Hint: Trabaje con un n�mero fijo de muestras y que sea m�ltiplo de 
%   2 (128, 256, 512, 1024, etc.) que servir� para trabajos futuros. 
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

%% Definici�n de par�metros :

fs = 100 ;          % Frecuencia de muestreo fs = 100 Hz
N = 182 ;          % Cantidad de muestras a generar N = 1024

%% S�ntesis de las se�ales 

% ---------------------------------------------
%               Se�al senoidal:
% ---------------------------------------------

A = 2 ;             % Amplitud de la se�al
f0 = 1 ;            % Frecuencia fundamental de la se�al 10 Hz
ph0 = 0 ;           % Fase de la se�al = 0 rad

[sig t] = mySin (A, f0, ph0, N, fs) ;   % Genero la se�al

PlotTiempo(sig, t, 'Se�al senoidal',  't','sin(t)', 1, 'r') ;
pause ;

% ---------------------------------------------
%               Se�al Pulso:
% ---------------------------------------------


A = 3 ;             % Amplitud del pulso
t0 = 0 ;            % Instante inicial del pulso
t1 = 0.21 ;          % Instante final del pulso

[sig t] = myPulse(A ,t0 ,t1 ,N , fs) ;

PlotTiempo (sig, t, 'Pulso', 't', 'u(t-t0)-u(t-t1)', 1, 'r' ) ;
pause ;

% ---------------------------------------------
%          Se�al Amplitud Modulada:
% ---------------------------------------------

Am = 0.1 ;          % Amplitud de la se�al modulante
Ac = 1 ;            % Amplitud de la portadora
fm = 1 ;            % Frecuencia de la modulante 0.1 Hz
fc = 5;             % Frecuencia de la portadora 2 Hz

[sig t ] = myAM( Am, Ac, fm, fc, N, fs ) ;

PlotTiempo ( sig, t, 'Amplitud Modulada', 't', 'Modulaci�n AM', 1, 'r' ) ;
pause ;

% ---------------------------------------------
%           Se�al Exponencial
% ---------------------------------------------

A = 1 ;             % Amplitud de la se�al
t0 = 0.5 ;          % Instante inicial de la se�al
alpha = -2 ;        % tao = 1 seg

[signal timeAxis] = myExp(A ,t0 ,alpha ,N , fs) ;
PlotTiempo ( signal, timeAxis, 'Se�al Exponencial', 't', 'A.exp(alpha.t)', 1, 'r' ) ;
pause ;
% ---------------------------------------------
%          Se�al Frecuencia Modulada
% ---------------------------------------------

Am = pi/2 ;             % Amplitud de la modulante
Ac = 1 ;                % Amplitud de la portadora

fm = 2 ;                % Frecuencia de la modulante
fc = 5 ;                % Frecuencia de la portadora

[signal timeAxis] = myFM( Am, Ac, fm, fc, N, fs ) ;
PlotTiempo ( signal, timeAxis, 'Frecuencia Modulada', 't', 'Modulaci�n en frecuencia', 1, 'r' ) ;

pause ;

% ---------------------------------------------
%          Se�al Delta de Dirac
% ---------------------------------------------

A = 6 ;                 % Amplitud de la se�al
t0 = 3.2 ;              % Instante inicial de la se�al

[signal timeAxis] = myDelta( A, t0, N, fs ) ;
PlotTiempo ( signal, timeAxis, 'Delta de Dirac', 't', 'd(t-t0)', 1, 'r' ) ;

pause ;

% ---------------------------------------------
%               Se�al Sampling
% ---------------------------------------------

A = 2 ;                 % Amplitud de la se�al
f0 = 10 ;               % Frecuencia fundamental de la se�al
t0 = 1.3 ;              % Retardo de la se�al

[signal timeAxis] = mySinc( A, f0, t0 ,N , fs) ;
PlotTiempo ( signal, timeAxis, 'Funcion Sampling', 't', 'sinc(w0*(t-t0))', 1, 'r' ) ;

pause ;
% ---------------------------------------------
%            Se�al Subamortiguada
% ---------------------------------------------

A = 1 ;                 % Amplitud de la se�al
f0 = 5 ;                % Frecuencia fundamental de la se�al
alpha = 1/2 ;           % Tao = 2 s

[signal timeAxis] = mySubamort( A, f0, alpha ,N , fs) ;
PlotTiempo (signal, timeAxis, 'Funcion Subamortiguada', 't', 'SubAmortiguamiento', 1, 'r' ) ;

pause ;

