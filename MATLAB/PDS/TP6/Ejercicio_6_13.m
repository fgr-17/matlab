% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_13.m
%
%   Enunciado:  13. Filtrar las se�ales del ejercicio 6 si la ventana 
%   considerada es:
%
%               w(t) = [w0 / (pi * Fs)]* sinc(w0*t)
%
%   Realizar gr�ficos y tener en cuenta todas las consideraciones 
%   implementadas en los ejercicios anteriores.
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

ta = 0;                                                                     % Tiempo de inicio del primer intervalo
tb = 1;                                                                     % Tiempo de fin del primer intervalo y comienzo del 2do
tc = 2;                                                                     % Intervalo 2 y comienzo del 3
td = 3;                                                                     % Fin del intervalo

N = 512;                                                                    % Cantidad de muestras del intervalo

dt = td - ta;                                                               % Intervalo entero de tiempo
Ts = dt/N;                                                                  % Per�odo de muestreo
Fs = 1/Ts;                                                                  % Frecuencia de muestreo

t = 0:(N - 1);                                                              % N�mero de muestras
t = t * Ts;                                                                 % Array de tiempo
t = t - ta;                                                                 % Comienzo el array de tiempo desde ta

t_p1 = (t >= ta) & (t < tb);                                                % Segmento temporal de la primer parte de la se�al
t_p2 = (t >= tb) & (t < tc);                                                % Segmento temporal de la segunda parte de la se�al
t_p3 = (t >= tc) & (t < td);                                                % Segmento temporal de la tercer parte de la se�al

% ---------------------- Par�metros de la venana de gabor ----------------------

a = 1/256;

% ---------------------- Armo la se�al a analizar ---------------------- 

f0 = [8     16      32];                                                    % Frecuencias modulantes
t0 = [0.5   1.5     2.5];                                                   % Desplazamientos de tiempo

fc = 2;                                                                    % Estrechez de la ventana a filtrar

ha = mySin(3, f0(1), 0, N, Fs);                                             % Primer parte de la se�al
hb = mySin(2, f0(2), 0, N, Fs);                                             % Segunda parte de la se�al
hc = mySin(1, f0(3), 0, N, Fs);                                             % Tercer parte de la se�al

h(t_p1) = ha(t_p1);                                                         % Guardo la primer parte en la se�al final
h(t_p2) = hb(t_p2);                                                         % Guardo la 2da parte en la se�al final
h(t_p3) = hc(t_p3);                                                         % Guardo la 3er parte en la se�al final

for i = 1: 3

    [Wmod tW]= my_Wavelet(fc, f0(i), t0(i), N, Fs);                         % Ventana de an�lisis
    
    y = filter(Wmod, 1, h);                                                 % Filtro la se�al con la ventana de Gabor      

    %% Grafico las se�ales de resultado:

    figure();
    
    NF = 3;
    NC = 2;
    xlab = 't[s]';
    % ---------------------- Grafico la ventana de Gabor ----------------------

    titulo = sprintf('Ventana de Gabor de an�lisis');
    ylab = 'W(t)';
    mode = 0;
    color = '-g';
    subplot(NF, NC, 1); PlotTiempo(Wmod, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, 2); PlotFFT(Wmod, Fs, 'Espectro de la Ventana de Gabor', 0, 'f[Hz]');  % PlotFFT2(Wmod, Fs, '-b', 2, NF, NC, 2);

    % ---------------------- Grafico la se�al a analizar ---------------------- 

    titulo = sprintf('Se�al a analizar Modulada f0 = %d [Hz]', f0(i));
    ylab = 'f(t)';
    mode = 0;
    color = '-g';
    subplot(NF, NC, 3); PlotTiempo(h, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, 4); PlotFFT(h, Fs, 'Espectro de la se�al a analizar', 0, 'f[Hz]');  % PlotFFT2(h , Fs, '-b', 2); %, NF, NC, 5);

    % ---------------------- Grafico la se�al a analizar ----------------------

    titulo = 'Se�al de salida ';
    ylab = 'W * f(t)';
    mode = 0;
    color = '-g';
    subplot(NF, NC, 5); PlotTiempo(y, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, 6); PlotFFT(y, Fs, 'Se�al de salida', 0, 'f[Hz]');                  % PlotFFT2(y, Fs, '-b', 2); %, NF, NC, 8);

    titulo = sprintf('Segunda Aproximaci�n T.Gabor fmod = %.0f[Hz]', f0(i));
    set(gcf, 'Name', titulo);
    
end


