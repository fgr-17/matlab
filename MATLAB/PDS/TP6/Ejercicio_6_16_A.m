% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_16_a.m
%
%   Enunciado:  16. A partir de las se�ales generadas en los ejercicios 2 y
%   6, se pide filtrarlas con una ventana de Gabor escalada para distintos 
%   valores de la escala.
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

t = ta:Ts:(tb - Ts);
% ---------------------- Par�metros de la venana de gabor ----------------------

alfa = 1/16;
t0 = 4;

a = [1 2 4 8];                                                                  % Diferentes valores de a para comprimir la ventana
aN = size(a, 2);                                                                % Cantidad de valores de compresi�n a usar 

%% Grafico las se�ales de resultado:

NF = 1 + aN;                                                                        % Cantidad de filas del gr�fico
NC = 4;                                                                             % Cantidad de columnas del gr�fico

xlab = 't[s]';                                                                      % Etiqueta del array de tiempo

% ---------------------- Armo la se�al a analizar ---------------------- 
titulo = 'Se�al a analizar';
ylab = 'f(t)';
mode = 0;
color = '-g';
f = mySin(3, 2, 0, N, Fs) + mySin(1, 4, pi/4, N, Fs);                           % Se�al a analizar
subplot(NF, NC, [1 NC]); PlotTiempo(f, t, titulo, xlab, ylab, mode, color);

for i = 1:aN
    
    
    [W tW]= my_Gabor_Win(alfa, t0/a(i), N, Fs * a(i));                              % Ventana de an�lisis
  
    % ---------------------- Armo la se�al con la ventana aplicada ---------------------- 

    y = f .* W;                                                                     % Se�al con la ventana aplicada

    ind = (i * 4) + 1;                                                              % Indice del plot a mostrar
    
    % ---------------------- Grafico la ventana de Gabor ----------------------

    titulo = sprintf('Gabor a = %.0f', a(i));
    ylab = 'W(t)';
    mode = 0;
    color = '-g';     
    subplot(NF, NC, ind); PlotTiempo(W, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, ind + 1); PlotFFT2(W, Fs, '-b', 2); 

    % ---------------------- Grafico la se�al a analizar ----------------------

    titulo = 'Se�al de salida ';
    ylab = 'W * f(t)';
    mode = 0;
    color = '-g';
    subplot(NF, NC, ind + 2); PlotTiempo(y, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, ind + 3); PlotFFT2(y, Fs, '-b', 2); 

end
titulo = sprintf('Ventana de Gabor Comprimida');
set(gcf, 'Name', titulo);


