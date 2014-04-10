% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_12.m
%
%   Enunciado:  12. Considere una ventana
%
%       w(t) = (2f0/Fs) * sinc(2*pi*f0*t)
%
%   Con Fs = 128Hz, f0 = 8Hz, N = 512, factores de escalamiento a = 2, 4 y
%   8 y frecuencia de modulaci�n fm = 32Hz. Represente en los dominios del 
%   tiempo y frecuencia estas ventanas escaladas. Repita el an�lisis con
%   una ventana de Gabor con alfa = 1/128, N =1024.
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

Fs = 128;
Ts = 1/Fs;
N = 512;

%% Par�metros de la ventana
t0 = ((N - 1)/2)*Ts
fm = 32;                                                                    % Frecuencias modulantes
f0 = 8;                                                                     % Frecuencias de corte del filtro

a = [2, 4, 8];                                                              % Factores de escalamiento

%% Calculo y grafico las diferentes ventanas:

NF = 4;
NC = 3;

xlab = 't[s]';

for i = 1: 3

    [Wmod tW] = Ondita_Basica(a(i), t0, f0, fm, N, Fs);                           % Calculo los coeficientes de la ventana modulada    

    %% Grafico las se�ales de resultado:      
    
    % ---------------------- Grafico la ventana de Gabor ----------------------

    titulo = sprintf('Ventana sinc contraida a = %.1f', a(i));
    ylab = 'W(t)';
    mode = 0;
    color = '-g';
    ind = (i - 1)*3 + 1;
    subplot(NF, NC, ind); PlotTiempo(Wmod, tW, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, ind + 1); PlotFFT2(Wmod, Fs, '-b', 1, NF, NC, ind + 1); 
    
end
    
alfa = 1 / 128;                                                                     % Factor de la ventana de gabor
N = 1024;                                                                           % Cantidad de muestras
    
titulo = 'Ventana de Gabor N = 1024, alfa = 1 / 128';
t0 = ((N - 1)/2) * Ts;                                                              % t0 para centrar la se�al en el medio

fmod = mySin(1, f0, 0, N, Fs);                                                      % Se�al modulante
[W tG] = my_Gabor_Win(alfa, t0, N, Fs);                                            % Calculo la ventana

Wg = W .* fmod;

subplot(NF, NC, 10); PlotTiempo(Wg, tG, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 11); PlotFFT2(Wg, Fs, '-b', 1, NF, NC, 11); 

titulo = sprintf('Ventana de Sinc');
set(gcf, 'Name', titulo);
