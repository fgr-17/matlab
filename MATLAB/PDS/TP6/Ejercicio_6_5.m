% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_2.m
%
%   Enunciado:  5. Utilizando la se�al del ejercicio 2, module las mismas 
%   con frecuencias de modulaci�n de 1, 2 y 4 Hz, observando sus espectros 
%   en frecuencia y verificando la propiedad de desplazamiento frecuencial 
%   de la Transformada de Fourier.
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

clc;                                                                            % Limpio el workspace
close all;                                                                      % Cierro todas las figuras
clear all;                                                                      % Cierro todas las variables

%% Seteo los par�metros del ejercicio:

ta = -4;                                                                        % Tiempo de inicio del intervalo
tb = 4;                                                                         % Tiempo de fin del intervalo
N = 512;                                                                        % Cantidad de muestras del intervalo

dt = tb - ta;
Ts = dt/N;
Fs = 1/Ts;

t = ta:Ts:(tb - Ts);
% ---------------------- Par�metros de la venana de gabor ----------------------

a = 1/16;                                                                       % Par�metro de dispersi�n
t0 = 2;                                                                         % Retardo de la ventana
[W tW]= my_Gabor_Win(a, t0, N, Fs);                                             % Ventana de an�lisis
f0 = [1 2 4];                                                                   % frecuencias de modulaci�n

f = mySin(3, 2, 0, N, Fs) + mySin(1, 4, pi/4, N, Fs);                          % Se�al a analizar

for i = 1:3  
    
    % ---------------------- Armo la se�al a analizar ---------------------- 
    
    fmod = mySin(1, f0(i), 0, N, Fs);                                           % Se�al de modulaci�n
    Wmod = W .* fmod;                                                            % Ventana modulada
    
    y = f .* Wmod;                                                              % Se�al con la ventana aplicada

    %% Grafico las se�ales de resultado:

    NF = 3;
    NC = 3;

    xlab = 't[s]';

    figure();
    
    % ---------------------- Grafico la ventana de Gabor ----------------------
    
    titulo = 'Ventana de Gabor de an�lisis';
    ylab = 'W(t)';
    mode = 0;
    color = '-g';
    subplot(NF, NC, 1); PlotTiempo(Wmod, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, 2); PlotFFT2(Wmod, Fs, '-b', 1, NF, NC, 2);   
    
    % ---------------------- Grafico la se�al a analizar ---------------------- 

    titulo = sprintf('Se�al a analizar f = %.2f [Hz]', f0(i));
    ylab = 'f(t)';
    mode = 0;
    color = '-g';
    subplot(NF, NC, 4); PlotTiempo(f, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, 5); PlotFFT2(f, Fs, '-b', 1, NF, NC, 5); 

    % ---------------------- Grafico la se�al producto  ----------------------

    titulo = 'Se�al de salida ';
    ylab = 'W * f(t)';
    mode = 0;
    color = '-g';
    subplot(NF, NC, 7); PlotTiempo(y, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, 8); PlotFFT2(y, Fs, '-b', 1, NF, NC, 8); 

    titulo = sprintf('Ventana de Gabor. Propiedad de desplazamiento ');
    set(gcf, 'Name', titulo);

end
