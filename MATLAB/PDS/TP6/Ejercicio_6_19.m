% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_18.m
%
%   Enunciado:  18. Comprobar que para distintas escalas, es lo mismo 
%   considerar: a) g(t/a) con un intervalo t = [-5a, 5a] muestreado a 
%   intervalos enteros que b) g(t) con el intervalo t=[- 5, 5] con un 
%   intervalo de muestreo 1 a . Utilice para su ejemplo, una Ventana de
%   Gabor Gaussiana.
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

Fs = 1;                                                                     % Muestreo a intervalos enteros

[M] = Paramet('Escalamiento de una sinc 2^j','j = ');

NF = M + 1;
NC = 2;

xlab = 't[s]';

for j = 0:M
    % ---------------------- Parámetros de la primer venana de gabor ----------------------

    a = 2^j;                                                                    % Contracción de la ventana

    ta = -(50 * a);                                                             % Tiempo de inicio del intervalo
    tb =  (50 * a);                                                          	% Tiempo de fin del intervalo

    Dt = tb - ta;                                                               % Longitud del intervalo de tiempo
    t0 = Dt / 2;                                                                % Centro la ventana en cero
    N = Dt * Fs;                                                                % Cantidad de muestras

    [W1 tW]= mySinc(1, 1/a, t0, N, Fs);                                         % Ventana de análisis

    sum_W1 = sum(W1);                                                           % Calculo la suma(integral o área) del filtro
	W1 = W1 / sum_W1;                                                           % Normalizo el filtro para que tenga amplitud unitaria

    
    % -------------------------- Grafico las señales de resultado: ------------------------

    titulo = sprintf('Sinc comprimida 2^(%.0f)', j);
    ylab = sprintf('W%.0f(t)', j);
    mode = 0;
    color = '.g';
    ind = 2*j + 1;
    subplot(NF, NC, ind); PlotTiempo(W1, tW, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, ind + 1); PlotFFT(W1, Fs, titulo, 0, ylab);

end
titulo = sprintf('Ventana de Gabor Modulada');
set(gcf, 'Name', titulo,'NumberTitle','off','menubar','none');
