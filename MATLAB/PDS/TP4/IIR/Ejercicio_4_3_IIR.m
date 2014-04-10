% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_4_3_IIR.m
%
%   Enunciado:  3. Teniendo en cuenta la Funci�n de Transferencia del 
%   Ejercicio N� 12 de la Gu�a de Trabajos Pr�cticos N� 4 (Filtro Notch 
%   Activo), se pide una implementaci�n digital IIR del mismo en la cual la 
%   frecuencia a eliminar sea de f0=50 Hz siendo la frecuencia de muestreo de 
%   fs=1 KHz. Elija el Q del Filtro Notch anal�gico de tal manera de conseguir
%   la m�xima atenuaci�n a la frecuencia de eliminaci�n (puede utilizar el 
%   comando tf de Matlab de la funci�n de transferencia del filtro anal�gico 
%   para elegir el mejor factor de selectividad). Verifique adem�s el resultado 
%   del IIR Notch dise�ado graficando la respuesta al impulso del Filtro 
%   Digital como as� tambi�n su respuesta en Frecuencia. �Que pasa si la 
%   frecuencia de muestreo fuera 200 Hz?.
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Se�ales(PDS)
%   Departamento de Ing.Electr�nica.
%   Facultad Buenos Aires
%   Universidad Tecnol�gica Nacional
%
% -------------------------------------------------------------------------

%% Inicializaci�n:

clc;                                                                        % Limpio el workspace
close all;                                                                  % Cierro todas las figuras
clear all;                                                                  % Cierro todas las variables

%% C�lculo del filtro:

s = tf('s');                                                                % Inicializo la variable 's'
f0 = 60;                                                                    % Frecuencia de Eliminaci�n
Fs = 1000;                                                                  % Frecuencia de Muestreo
w0 = 2*pi*f0;	                                                            % Frecuencia angular de muestreo
Q0 = 100;   	                                                            % Factor de Selectividad Elegido

Num = [1 0 w0^2];                                                           % Numerador del Filtro Notch
Den = [1 w0/Q0 w0^2];                                                       % Denominador del Filtro Notch

H = tf(Num,Den);                                                            % Filtro Notch Anal�gico de 50 Hz


[Numz,Denz] = bilinear(Num,Den,Fs);                                         % Calculo el filtro en el dominio 'z'

%% Grafico los resultados:

fig1 = figure(1);                                                           % Primer figura
bode(H);
zoom on;
[Hd, W] = freqz(Numz, Denz);                                                % Grafico la respuesta en el dominio 'z'
F = Fs * W./(2*pi);

fig2 = figure(2);                                                           % Segunda figura
NF = 2;                                                                     % N�mero de filas del plot
NC = 1;                                                                     % N�mero de columnas

subplot(NF, NC, 1);                 
plot(F, abs(Hd));                                                           % Grafico el m�dulo de la respuesta en frecuencia                                    
xlabel('Hz'); ylabel('Hd');                                                 % Cambio los labels

HHd = tf(Numz,Denz,1/Fs);                                                   % Filtro Notch Anal�gico de 60 Hz

Z = roots(Numz);
P = roots(Denz);

subplot(NF, NC, 2);
zplane(Z, P);