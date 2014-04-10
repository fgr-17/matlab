% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_11.m
%
%   Enunciado:  11. Realizar el filtrado de la señal:
%
%           f(t) = 3sin(2pi*16t)+ sin(2*pi*20*t) 
%
%   buscando adecuadamente el valor de a a utilizar para lograr separar 
%   las 2 frecuencias (16 y 20 Hz) presentes en la señal f(t). El resultado 
%   debe ser una senoidal pura a cada una de estas 2 frecuencias. Represente 
%   todo el proceso gráficamente.
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

clc;                                                                            % Limpio el workspace
close all;                                                                      % Cierro todas las figuras
clear all;                                                                      % Cierro todas las variables

%% Seteo los parámetros del ejercicio:

Fs = 160;                                                                       % Frecuencia de muestreo
L = 128;                                                                         % Longitud de la señal

t = 0:(L - 1);                                                                  % Número de muestras
t = t/Fs;                                                                       % Array temporal

f01 = 16;                                                                       % Primer frecuencia a detectar
f02 = 20;                                                                       % Segunda frecuencia a detectar

f = mySin(3, f01, 0, L, Fs) + mySin(1, f02, 0, L, Fs);                          % Genero las señales a analizar

%% Parámetros de la T. Gabor

t0 = (L - 1) / (2 * Fs);                                                        % Desplazo la ventana al centro
a = 1/64:1/16:1/4;                                                              % Dispersión de la ventana
aN = size(a, 2);                                                                % Cantidad de valores de "a" a analizar

%% Grafico la función a analizar

NF = 1 + aN;                                                                   
NC = 2;                                                                       

titulo = 'Señal a analizar';
xlab = 't[s]';
ylab = 'f(t)';
mode = 0;
color = '-g';
subplot(NF, NC, [1 NC]); PlotTiempo(f, t, titulo, xlab, ylab, mode, color);     % Grafico la señal a procesar

for k = 1:aN

    [y1 t] = Transformada_Gabor_A1(f, a(k), t0, f01, Fs);
    [y2 t] = Transformada_Gabor_A1(f, a(k), t0, f02, Fs);
    
    ylab = 'Ga(t)';
    mode = 0;
    color = '.g';   
    
    ind = 1 + 2*k;
    titulo = sprintf('a = %.4f  f01 = %.2f[Hz]', a(k), f01);
    subplot(NF, NC, ind); PlotFFT(y1, Fs, titulo, mode, ylab); 
    
    ind = 2 + 2*k;
    titulo = sprintf('a = %.4f  f02 = %.2f[Hz]', a(k), f02);
    subplot(NF, NC, ind); PlotFFT(y2, Fs, titulo, mode, ylab); 
    
end

titulo = sprintf('Ejercicio 6.11 - Discriminación de 2 frecuencias mediante Gabor');
set(gcf, 'Name', titulo);
