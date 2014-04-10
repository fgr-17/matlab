% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_16_b.m
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

% ---------------------- Armo la se�al a analizar ---------------------- 

f0 = [8     16      32];                                                    % Frecuencias modulantes
t0 = [0.5   1.5     2.5];                                                   % Desplazamientos de tiempo

ha = mySin(3, f0(1), 0, N, Fs);                                             % Primer parte de la se�al
hb = mySin(2, f0(2), 0, N, Fs);                                             % Segunda parte de la se�al
hc = mySin(1, f0(3), 0, N, Fs);                                             % Tercer parte de la se�al

h(t_p1) = ha(t_p1);                                                         % Guardo la primer parte en la se�al final
h(t_p2) = hb(t_p2);                                                         % Guardo la 2da parte en la se�al final
h(t_p3) = hc(t_p3);                                                         % Guardo la 3er parte en la se�al final

% ---------------------- Par�metros de la venana de gabor ----------------------

alfa = 1/256;

a = [2 4 8];                                                                % Diferentes valores de a para comprimir la ventana
aN = size(a, 2);                                                            % Cantidad de valores de compresi�n a usar 

%% Grafico las se�ales de resultado:

NF = 1 + aN;                                                                % Cantidad de filas del gr�fico
NC = 4;                                                                     % Cantidad de columnas del gr�fico

xlab = 't[s]';                                                              % Etiqueta del array de tiempo

titulo = 'Se�al a analizar';
ylab = 'f(t)';
mode = 0;
color = '-g';
subplot(NF, NC, [1 NC]); PlotTiempo(h, t, titulo, xlab, ylab, mode, color);

for i = 1:aN
    
    
    [W tW]= my_Gabor_Win(alfa, t0(i)/a(i), N, Fs * a(i));                   % Ventana de an�lisis
  
    % ---------------------- Armo la se�al con la ventana aplicada ---------------------- 

    y = h .* W;                                                             % Se�al con la ventana aplicada
    
    % y = filter(W, 1, h);
    ind = (i * 4) + 1;                                                      % Indice del plot a mostrar
    
    % ---------------------- Grafico la ventana de Gabor ----------------------

    titulo = sprintf('V.Gabor a = %d', a(i));
    ylab = 'W(t)';
    mode = 0;
    color = '-g';     
    subplot(NF, NC, ind); PlotTiempo(W, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, ind + 1); PlotFFT2(W, Fs, '-b', 2); 

    % ---------------------- Grafico la se�al a analizar ----------------------

    titulo = 'Se�al de salida';
    ylab = 'W * f(t)';
    mode = 0;
    color = '-g';
    subplot(NF, NC, ind + 2); PlotTiempo(y, t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, ind + 3); PlotFFT2(y, Fs, '-b', 2); 

end
titulo = sprintf('Ventana de Gabor Comprimida');
set(gcf, 'Name', titulo);


