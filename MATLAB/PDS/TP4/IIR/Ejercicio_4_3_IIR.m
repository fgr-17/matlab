% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_4_3_IIR.m
%
%   Enunciado:  3. Teniendo en cuenta la Función de Transferencia del 
%   Ejercicio Nº 12 de la Guía de Trabajos Prácticos Nº 4 (Filtro Notch 
%   Activo), se pide una implementación digital IIR del mismo en la cual la 
%   frecuencia a eliminar sea de f0=50 Hz siendo la frecuencia de muestreo de 
%   fs=1 KHz. Elija el Q del Filtro Notch analógico de tal manera de conseguir
%   la máxima atenuación a la frecuencia de eliminación (puede utilizar el 
%   comando tf de Matlab de la función de transferencia del filtro analógico 
%   para elegir el mejor factor de selectividad). Verifique además el resultado 
%   del IIR Notch diseñado graficando la respuesta al impulso del Filtro 
%   Digital como así también su respuesta en Frecuencia. ¿Que pasa si la 
%   frecuencia de muestreo fuera 200 Hz?.
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Señales(PDS)
%   Departamento de Ing.Electrónica.
%   Facultad Buenos Aires
%   Universidad Tecnológica Nacional
%
% -------------------------------------------------------------------------

%% Inicialización:

clc;                                                                        % Limpio el workspace
close all;                                                                  % Cierro todas las figuras
clear all;                                                                  % Cierro todas las variables

%% Cálculo del filtro:

s = tf('s');                                                                % Inicializo la variable 's'
f0 = 60;                                                                    % Frecuencia de Eliminación
Fs = 1000;                                                                  % Frecuencia de Muestreo
w0 = 2*pi*f0;	                                                            % Frecuencia angular de muestreo
Q0 = 100;   	                                                            % Factor de Selectividad Elegido

Num = [1 0 w0^2];                                                           % Numerador del Filtro Notch
Den = [1 w0/Q0 w0^2];                                                       % Denominador del Filtro Notch

H = tf(Num,Den);                                                            % Filtro Notch Analógico de 50 Hz


[Numz,Denz] = bilinear(Num,Den,Fs);                                         % Calculo el filtro en el dominio 'z'

%% Grafico los resultados:

fig1 = figure(1);                                                           % Primer figura
bode(H);
zoom on;
[Hd, W] = freqz(Numz, Denz);                                                % Grafico la respuesta en el dominio 'z'
F = Fs * W./(2*pi);

fig2 = figure(2);                                                           % Segunda figura
NF = 2;                                                                     % Número de filas del plot
NC = 1;                                                                     % Número de columnas

subplot(NF, NC, 1);                 
plot(F, abs(Hd));                                                           % Grafico el módulo de la respuesta en frecuencia                                    
xlabel('Hz'); ylabel('Hd');                                                 % Cambio los labels

HHd = tf(Numz,Denz,1/Fs);                                                   % Filtro Notch Analógico de 60 Hz

Z = roots(Numz);
P = roots(Denz);

subplot(NF, NC, 2);
zplane(Z, P);