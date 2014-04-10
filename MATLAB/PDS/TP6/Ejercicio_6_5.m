% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_2.m
%
%   Enunciado:  5. Utilizando la señal del ejercicio 2, module las mismas 
%   con frecuencias de modulación de 1, 2 y 4 Hz, observando sus espectros 
%   en frecuencia y verificando la propiedad de desplazamiento frecuencial 
%   de la Transformada de Fourier.
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

ta = -4;                                                                        % Tiempo de inicio del intervalo
tb = 4;                                                                         % Tiempo de fin del intervalo
N = 512;                                                                        % Cantidad de muestras del intervalo

dt = tb - ta;
Ts = dt/N;
Fs = 1/Ts;

t = ta:Ts:(tb - Ts);
% ---------------------- Parámetros de la venana de gabor ----------------------

a = 1/16;                                                                       % Parámetro de dispersión
t0 = 2;                                                                         % Retardo de la ventana
[W tW]= my_Gabor_Win(a, t0, N, Fs);                                             % Ventana de análisis
f0 = [1 2 4];                                                                   % frecuencias de modulación

f = mySin(3, 2, 0, N, Fs) + mySin(1, 4, pi/4, N, Fs);                          % Señal a analizar

for i = 1:3  
    
    % ---------------------- Armo la señal a analizar ---------------------- 
    
    fmod = mySin(1, f0(i), 0, N, Fs);                                           % Señal de modulación
    Wmod = W .* fmod;                                                            % Ventana modulada
    
    y = f .* Wmod;                                                              % Señal con la ventana aplicada

    %% Grafico las señales de resultado:

    NF = 3;
    NC = 3;

    xlab = 't[s]';

    figure();
    
    % ---------------------- Grafico la ventana de Gabor ----------------------
    
    titulo = 'Ventana de Gabor de análisis';
    ylab = 'W(t)';
    mode = 0;
    color = '-g';
    subplot(NF, NC, 1); PlotTiempo(Wmod, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, 2); PlotFFT2(Wmod, Fs, '-b', 1, NF, NC, 2);   
    
    % ---------------------- Grafico la señal a analizar ---------------------- 

    titulo = sprintf('Señal a analizar f = %.2f [Hz]', f0(i));
    ylab = 'f(t)';
    mode = 0;
    color = '-g';
    subplot(NF, NC, 4); PlotTiempo(f, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, 5); PlotFFT2(f, Fs, '-b', 1, NF, NC, 5); 

    % ---------------------- Grafico la señal producto  ----------------------

    titulo = 'Señal de salida ';
    ylab = 'W * f(t)';
    mode = 0;
    color = '-g';
    subplot(NF, NC, 7); PlotTiempo(y, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, 8); PlotFFT2(y, Fs, '-b', 1, NF, NC, 8); 

    titulo = sprintf('Ventana de Gabor. Propiedad de desplazamiento ');
    set(gcf, 'Name', titulo);

end
