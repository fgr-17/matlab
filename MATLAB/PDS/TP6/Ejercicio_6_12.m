% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_12.m
%
%   Enunciado:  12. Considere la siguiente función de ventana:
%
%       w(t) = w0/(pi* Fs) * sinc(w0*t)
%
%   Realice un programa MatLab que tenga como ingreso a la frecuencia de 
%   muestreo fs y grafique en tiempo y en frecuencia, esta ventana temporal y 
%   diferentes frecuencias centrales de filtro para visualizar un banco de 
%   filtros con esta señal temporal. Utilice N = 512 y una frecuencia de 
%   muestreo de = 128 S f Hz.
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

% ---------------------- Parámetros de la venana de gabor ----------------------

t0 = 4;

f0 = [2 4 8];                                                               % Frecuencias modulantes
fc = 1;                                                                     % Frecuencias de corte del filtro

NF = 3;
NC = 3;
xlab = 't[s]';

for i = 1: 3

    [Wmod tW] = my_Wavelet(fc, f0(i), t0, N, Fs);                           % Calculo los coeficientes de la ventana modulada    

    %% Grafico las señales de resultado:      
    
    % ---------------------- Grafico la ventana de Gabor ----------------------

    titulo = sprintf('Ventana sinc f0 = %d[Hz]', f0(i));
    ylab = 'W(t)';
    mode = 0;
    color = '-g';
    ind = (i - 1)*3 + 1;
    subplot(NF, NC, ind); PlotTiempo(Wmod, tW, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, ind + 1); PlotFFT2(Wmod, Fs, '-b', 1, NF, NC, ind + 1); 
    
end

titulo = sprintf('Ventana de Sinc');
set(gcf, 'Name', titulo);
