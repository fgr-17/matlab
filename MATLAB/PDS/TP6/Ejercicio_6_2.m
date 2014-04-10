% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_2.m
%
%   Enunciado:  2. Considere la señal
%   
%       f(t) = 3*sin(2*pi*2*t)+ cos(2*pi*4*t), 
%   
%   para el intervalo temporal -4 < t < 4 y trabajando w[a ,t0](t) con 
%   N=512, a=1/16 y un desplazamiento de la ventana de Gabor de t0 = 2, 
%   obtenga las señales temporales f(t), w[a, t0](t )  y f(t)*w[a, t0](t) 
%   así también como sus correspondientes espectros. Recuerde que el espectro 
%   de la señal f(t)*w[a, t0](t) es la Transformada de Gabor, para una 
%   determinada dispersión de ventana a y tiempo de desplazamiento t0. 
%   Esta es la Primer Forma de Análisis de la transformada de Gabor, es 
%   decir, considerando un desplazamiento temporal fijo.
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

%% Seteo los parámetros del ejercicio:

ta = -4;                                                                    % Tiempo de inicio del intervalo
tb = 4;                                                                     % Tiempo de fin del intervalo
N = 512;                                                                    % Cantidad de muestras del intervalo

dt = tb - ta;
Ts = dt/N;
Fs = 1/Ts;

t = ta:Ts:(tb - Ts);
% ---------------------- Parámetros de la venana de gabor ----------------------

a = 1/16;
t0 = 2;
[W tW]= my_Gabor_Win(a, t0, N, Fs);                                             % Ventana de análisis

% ---------------------- Armo la señal a analizar ---------------------- 

f = mySin(3, 2, 0, N, Fs) + mySin(1, 4, pi/4, N, Fs);                           % Señal a analizar

% ---------------------- Armo la señal a analizar ---------------------- 

y = f .* W;                                                                     % Señal con la ventana aplicada

%% Grafico las señales de resultado:

NF = 3;
NC = 3;

xlab = 't[s]';

% ---------------------- Grafico la ventana de Gabor ----------------------

titulo = 'Ventana de Gabor de análisis';
ylab = 'W(t)';
mode = 0;
color = '-g';
subplot(NF, NC, 1); PlotTiempo(W, t, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 2); PlotFFT2(W, Fs, '-b', 1, NF, NC, 2); % PlotFFT(W, Fs, 'Espectro de la Ventana de Gabor', 0, 'f[Hz]');

% ---------------------- Grafico la señal a analizar ---------------------- 

titulo = 'Señal a analizar';
ylab = 'f(t)';
mode = 0;
color = '-g';
subplot(NF, NC, 4); PlotTiempo(f, t, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 5); PlotFFT2(f, Fs, '-b', 1, NF, NC, 5); %PlotFFT(f, Fs, 'Espectro de la señal a analizar', 0, 'f[Hz]');

% ---------------------- Grafico la señal a analizar ----------------------

titulo = 'Señal de salida ';
ylab = 'W * f(t)';
mode = 0;
color = '-g';
subplot(NF, NC, 7); PlotTiempo(y, t, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 8); PlotFFT2(y, Fs, '-b', 1, NF, NC, 8); % PlotFFT(y, Fs, 'Señal de salida', 0, 'f[Hz]');

titulo = sprintf('Ventana de Gabor. Primer Forma de Análisis');
set(gcf, 'Name', titulo);


