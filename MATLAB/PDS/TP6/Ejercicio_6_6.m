% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_6.m
%
%   Enunciado:  6. Dada la siguiente señal temopral:
%
%   h(t) =  [ 3*sin(2pi*8*t)    , 0 <= t < 1
%           [ 2*sin(2pi*16*t)   , 1 <= t < 2
%           [   sin(2pi*32*t)   , 2 <= t < 3
%
%   con un parámetro a = 1/256 y frecuencias modulantes de 32 y 16 y 8 Hz 
%   para modular la señal h(t), filtre la misma considerando la segunda 
%   aproximación de la Transformada de Gabor considerando a w fijo y la señal 
%   temporal modulada que se pasa por un filtro pasabajos que es la ventana 
%   temporal de Gabor.
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

ta = 0;                                                                     % Tiempo de inicio del primer intervalo
tb = 1;                                                                     % Tiempo de fin del primer intervalo y comienzo del 2do
tc = 2;                                                                     % Intervalo 2 y comienzo del 3
td = 3;                                                                     % Fin del intervalo

N = 512;                                                                    % Cantidad de muestras del intervalo

dt = td - ta;                                                               % Intervalo entero de tiempo
Ts = dt/N;                                                                  % Período de muestreo
Fs = 1/Ts;                                                                  % Frecuencia de muestreo

t = 0:(N - 1);                                                              % Número de muestras
t = t * Ts;                                                                 % Array de tiempo
t = t - ta;                                                                 % Comienzo el array de tiempo desde ta

t_p1 = (t >= ta) & (t < tb);                                                % Segmento temporal de la primer parte de la señal
t_p2 = (t >= tb) & (t < tc);                                                % Segmento temporal de la segunda parte de la señal
t_p3 = (t >= tc) & (t < td);                                                % Segmento temporal de la tercer parte de la señal

% ---------------------- Parámetros de la venana de gabor ----------------------

a = 1/256;

% ---------------------- Armo la señal a analizar ---------------------- 

f0 = [8     16      32];                                                    % Frecuencias modulantes
t0 = [0.5   1.5     2.5];                                                   % Desplazamientos de tiempo

ha = mySin(3, f0(1), 0, N, Fs);                                             % Primer parte de la señal
hb = mySin(2, f0(2), 0, N, Fs);                                             % Segunda parte de la señal
hc = mySin(1, f0(3), 0, N, Fs);                                             % Tercer parte de la señal

h(t_p1) = ha(t_p1);                                                         % Guardo la primer parte en la señal final
h(t_p2) = hb(t_p2);                                                         % Guardo la 2da parte en la señal final
h(t_p3) = hc(t_p3);                                                         % Guardo la 3er parte en la señal final

for i = 1: 3

    [W tW]= my_Gabor_Win(a, t0(i), N, Fs);                                  % Ventana de análisis

    fmod = mySin(1, f0(i), 0, N, Fs);                                       % Señal modulante        
    Wmod = W .* fmod;                                                       % Modulo la señal a transformar
    
    y = filter(Wmod, 1, h);                                                 % Filtro la señal con la ventana de Gabor      

    %% Grafico las señales de resultado:

    figure();
    
    NF = 3;
    NC = 2;
    xlab = 't[s]';
    % ---------------------- Grafico la ventana de Gabor ----------------------

    titulo = sprintf('Ventana de Gabor de análisis');
    ylab = 'W(t)';
    mode = 0;
    color = '-g';
    subplot(NF, NC, 1); PlotTiempo(Wmod, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, 2); PlotFFT(Wmod, Fs, 'Espectro de la Ventana de Gabor', 0, 'f[Hz]');  % PlotFFT2(Wmod, Fs, '-b', 2, NF, NC, 2);

    % ---------------------- Grafico la señal a analizar ---------------------- 

    titulo = sprintf('Señal a analizar Modulada f0 = %d [Hz]', f0(i));
    ylab = 'f(t)';
    mode = 0;
    color = '-g';
    subplot(NF, NC, 3); PlotTiempo(h, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, 4); PlotFFT(h, Fs, 'Espectro de la señal a analizar', 0, 'f[Hz]');  % PlotFFT2(h , Fs, '-b', 2); %, NF, NC, 5);

    % ---------------------- Grafico la señal a analizar ----------------------

    titulo = 'Señal de salida ';
    ylab = 'W * f(t)';
    mode = 0;
    color = '-g';
    subplot(NF, NC, 5); PlotTiempo(y, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, 6); PlotFFT(y, Fs, 'Señal de salida', 0, 'f[Hz]');                  % PlotFFT2(y, Fs, '-b', 2); %, NF, NC, 8);

    titulo = sprintf('Segunda Aproximación T.Gabor fmod = %.0f[Hz]', f0(i));
    set(gcf, 'Name', titulo);
    
end


