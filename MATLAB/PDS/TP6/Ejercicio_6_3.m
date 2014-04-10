% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_6.m
%
%   Enunciado:  3. Dada la siguiente señal temopral:
%
%   f(t) =  [ 2*sin(2pi*64*t)   , 0 <= t < 1
%           [ 2*sin(2pi*16*t)   , 1 <= t < 2
%
%   N = 512 muestras, a = 1/64 y un desplazamiento de la ventana de Gabor 
%   de 0, 0.5, 1 1.5 0 t = y , obtenga las señales temporales f(t), w[a ,t0](t)  
%   y f(t)*w[a, t0](t) así también como sus correspondientes espectros.
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

ta = 0;                                                                    % Tiempo de inicio del intervalo
tb = 2;                                                                     % Tiempo de fin del intervalo
N = 512;                                                                    % Cantidad de muestras del intervalo

dt = tb - ta;
Ts = dt/N;
Fs = 1/Ts;

t = ta:Ts:(tb - Ts);
% ---------------------- Parámetros de la venana de gabor ----------------------

a = 1/64;
t0 = [0, 0.5, 1, 1.5];
t0_N = 4;


% ---------------------- Armo la señal a analizar ---------------------- 

fa = mySin(2, 64, 0, N, Fs);
fb = mySin(2, 16, 0, N, Fs);

f(1, 1:(N/2)) = fa(1:(N/2));
f(1, (N/2 + 1):N) = fb((N/2 + 1):N);


for i = 1:t0_N

    [W tW]= my_Gabor_Win(a, t0(i), N, Fs);                                             % Ventana de análisis
    y = f .* W;                                                                     % Señal con la ventana aplicada
    
    % y = filter(W, 1, f);

    %% Grafico las señales de resultado:

    figure();
    
    NF = 3;
    NC = 3;
    xlab = 't[s]';
    % ---------------------- Grafico la ventana de Gabor ----------------------

    titulo = sprintf('Ventana de Gabor de análisis, t0 = %f', t0(i));
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

    titulo = sprintf('Ventana de Gabor t0 = %f', t0(i));
    set(gcf, 'Name', titulo);
    
end


