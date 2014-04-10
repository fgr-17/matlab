% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_4_3.m
%
%   Enunciado: 3. Diseñe un filtro FIR diferenciador con N=40 usando una 
%   ventana de Blackman. Tenga en cuenta que los Diferenciadores FIR tienen 
%   respuesta al impulso antisimétrica, es decir h(n) = -h(N - 1 - n) y el 
%   número de muestras que lo componen, es decir N, debe ser un número par 
%   (en este caso 40) así su respuesta en frecuencia no es cero en w=pi.
%   Además la respuesta en frecuencia de un diferenciador ideal está dada
%   por:
%           H(e^jw) = j*sgn(w)*abs(w)*exp(-jaw)/pi
%
%   Grafique mediante MatLab la respuesta al impulso h[n] del filtro obtenido 
%   y su respuesta en frecuencia. Cambie N a un valor impar (por ejemplo 41) 
%   y repita el ejercicio. ¿Qué conclusión obtiene al respecto?.
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

%% Inicialización de señales a usar y parámetros:

N = 40;                                                                     
ws = (2*pi) / N;
w = 0:(N - 1);
w = w * ws;
w = w - pi;

alfa = 0.5;

H = 1i * sign(w) .* abs(w) .* exp(-1i * alfa * w) / pi;

h = ifft(H);
k = 0:(N - 1);


%% Grafico de las señales:

NF = 2;
NC = 1;

titulo = 'Respuesta al impulso del diferenciador';
xlab = 't';
ylab = 'h[k]';
mode = 1;
color = '-g';
subplot(NF, NC, 1);
PlotTiempo(abs(h), k, titulo, xlab, ylab, mode, color);

titulo = 'Respuesta en frecuencia del diferenciador';
ylab = 'H(w)';
mode = 0;
subplot(NF, NC, 2);
PlotFFT(abs(H), 1, titulo, mode, ylab);



