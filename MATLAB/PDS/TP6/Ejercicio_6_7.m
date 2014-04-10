% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_7.m
%
%   Enunciado:  7. Considere una Ventana de Gabor sim�trica, con una 
%   observaci�n temporal de 8 segundos, 512 puntos de la misma, un valor de
%   a = 1/16 , se pide modular a la misma con frecuencias de modulaci�n de
%   2, 4 y 8 Hz respectivamente, visualizando los espectros de la ventana 
%   original, as� tambi�n como los espectros de las ventanas moduladas por 
%   las distintas frecuencias modulantes.
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

clc;                                                                        % Limpio el workspace
close all;                                                                  % Cierro todas las figuras
clear all;                                                                  % Cierro todas las variables

%% Seteo los par�metros del ejercicio:

ta = -4;                                                                    % Tiempo de inicio del intervalo
tb = 4;                                                                     % Tiempo de fin del intervalo
N = 512;                                                                    % Cantidad de muestras del intervalo

dt = tb - ta;
Ts = dt/N;
Fs = 1/Ts;

% ---------------------- Par�metros de la venana de gabor ----------------------

a = 1/16;                                                                   % Par�metro
t0 = 4;

[W tW]= my_Gabor_Win(a, t0, N, Fs);                                         % Ventana de an�lisis

f0 = [2 4 8];                                                             % Frecuencias modulantes

NF = 3;
NC = 3;
xlab = 't[s]';

for i = 1: 3

   
    fmod = mySin(1, f0(i), pi/4 , N, Fs);                                        % Se�al modulante        
    Wmod = fmod .* W;                                                           % Se�al con la ventana aplicada

    %% Grafico las se�ales de resultado:      
    
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
