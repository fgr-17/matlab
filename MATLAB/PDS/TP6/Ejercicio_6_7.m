% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_7.m
%
%   Enunciado:  7. Considere una Ventana de Gabor simétrica, con una 
%   observación temporal de 8 segundos, 512 puntos de la misma, un valor de
%   a = 1/16 , se pide modular a la misma con frecuencias de modulación de
%   2, 4 y 8 Hz respectivamente, visualizando los espectros de la ventana 
%   original, así también como los espectros de las ventanas moduladas por 
%   las distintas frecuencias modulantes.
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

a = 1/16;                                                                   % Parámetro
t0 = 4;

[W tW]= my_Gabor_Win(a, t0, N, Fs);                                         % Ventana de análisis

f0 = [2 4 8];                                                             % Frecuencias modulantes

NF = 3;
NC = 3;
xlab = 't[s]';

for i = 1: 3

   
    fmod = mySin(1, f0(i), pi/4 , N, Fs);                                        % Señal modulante        
    Wmod = fmod .* W;                                                           % Señal con la ventana aplicada

    %% Grafico las señales de resultado:      
    
    % ---------------------- Grafico la ventana de Gabor ----------------------

    titulo = sprintf('Ventana de Gabor modulada f0 = %d[Hz]', f0(i));
    ylab = 'W(t)';
    mode = 0;
    color = '-g';
    ind = (i - 1)*3 + 1;
    subplot(NF, NC, ind); PlotTiempo(Wmod, tW, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, ind + 1); PlotFFT2(Wmod, Fs, '-b', 1, NF, NC, ind + 1); 
    
end

titulo = sprintf('Ventana de Gabor Modulada');
set(gcf, 'Name', titulo);
