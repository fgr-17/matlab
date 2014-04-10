% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_10.m
%
%   Enunciado:  10. Dada la siguiente se�al temporal:
%
%           {           0                       0 <= t < 1 - 0.05
%   h(t) =  { 0.5 + 0.5 sin (10 pi(t-1)),       1 - 0.05 <= t < 1 + 0.05
%           {           1                       1.05 <= t
%
%   filtrarla con una ventana de Gabor con un par�metro a = 1/64 para 
%   distintos valores de la frecuencia central del filtro pasabanda 
%   generado. Extraer conclusiones al respecto.
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

ta = 0;                                                                         % Tiempo de inicio del intervalo
tb = 1 - 0.05;                                                                  % Tiempo de fin del intervalo
tc = 1 + 0.05;
td = 2;

N = 16;                                                                        % Cantidad de muestras del intervalo

dt = td - ta;                                                                   % Duraci�n de la funci�n en tiempo
Ts = dt / N;                                                                    % Tiempo de sampleo (tiempo total dividido N)
Fs = 1 / Ts;                                                                    % Frecuencia de muestreo

t = 0:(N - 1);                                                                  % Array de tiempo en muestras
t = t * Ts;                                                                     % Array en tiempo
t = t - ta;                                                                     % Le quito el offset ta

t_p1 = ((t >= ta) & (t < tb));                                                  % Intervalo de tiempo correspondiente a la parte 1
t_p2 = ((t >= tb) & (t < tc));                                                  % Intervalo de tiempo correspondiente a la parte 2
t_p3 = ((t >= tc) & (t < td));                                                  % Intervalo de tiempo correspondiente a la parte 3

h = zeros(1, N);                                                                % Inicializo la funci�n con ceros

h2 = 0.5 + mySin(0.5, 5, 2*pi*5, N, Fs);                                        % Parte 2 de la funci�n

h(t_p2) = h2(t_p2);                                                             % Guardo en la funci�n final
h(t_p3) = 1;                                                                    % La parte 3 es igual a 1

% ---------------------- Par�metros de la venana de gabor ----------------------
    
a = 1/64;                                                                       % Par�metro de la ventana
f0 = [0.3 0.4 0.5 0.6 0.7];                                                     % Frecuencias a analizar

f0N = size(f0, 2);                                                              % Cantidad de frecuencias a analizar
t0N = 4;                                                                        % Cantidad de desplazamientos a analizar
dt0 = dt / t0N;                                                                 % Intervalo entre desplazamientos

%% Grafico la funci�n a analizar

NF = f0N + 1;                                                                   % La cantidad de filas del gr�fico es la ctdad de frecuencias + 1
NC = t0N;                                                                       % Cantidad de desplazamientos

titulo = 'Se�al a analizar';
xlab = 't[s]';
ylab = 'f(t)';
mode = 0;
color = '-g';
subplot(NF, NC, [1 NC]); PlotTiempo(h, t, titulo, xlab, ylab, mode, color);     % Grafico la se�al a procesar

%% Calculo y grafico las se�ales procesadas

for i = 1:f0N                                                                   % Barro todas las frecuencias a analizar
    
%    [y t] = Transformada_Gabor(h, a, t0N, f0(i), Fs);                          % Calculo la transformada de la funci�n en varios puntos

    for j = 1:t0N                                                               % Recorro todos los desplazamientos
        
        [y t] = Transformada_Gabor_A1(h, a, dt0 * (j - 1), f0(i), Fs);          % Calculo la transformada de la funci�n en varios puntos
        
        titulo = sprintf('t0 = %.1f[s] f0 = %.0f[Hz]', dt0 * (j - 1), f0(i));
        ylab = 'Ga(t)';
        mode = 0;
        color = '.g';
        ind = j + (i * t0N) ;
        subplot(NF, NC, ind); PlotFFT(y, Fs, titulo, mode, ylab);               % PlotTiempo(y, t, titulo, xlab, ylab, mode, color);
    end
    
end

titulo = sprintf('Segunda Aproximaci�n T.Gabor');
set(gcf, 'Name', titulo);
