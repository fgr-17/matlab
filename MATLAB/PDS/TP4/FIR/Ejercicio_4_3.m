% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_4_3.m
%
%   Enunciado: 3. Dise�e un filtro FIR diferenciador con N=40 usando una 
%   ventana de Blackman. Tenga en cuenta que los Diferenciadores FIR tienen 
%   respuesta al impulso antisim�trica, es decir h(n) = -h(N - 1 - n) y el 
%   n�mero de muestras que lo componen, es decir N, debe ser un n�mero par 
%   (en este caso 40) as� su respuesta en frecuencia no es cero en w=pi.
%   Adem�s la respuesta en frecuencia de un diferenciador ideal est� dada
%   por:
%           H(e^jw) = j*sgn(w)*abs(w)*exp(-jaw)/pi
%
%   Grafique mediante MatLab la respuesta al impulso h[n] del filtro obtenido 
%   y su respuesta en frecuencia. Cambie N a un valor impar (por ejemplo 41) 
%   y repita el ejercicio. �Qu� conclusi�n obtiene al respecto?.
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

%% Inicializaci�n de se�ales a usar y par�metros:

N = 40;                                                                     
ws = (2*pi) / N;
w = 0:(N - 1);
w = w * ws;
w = w - pi;

alfa = 0.5;

H = 1i * sign(w) .* abs(w) .* exp(-1i * alfa * w) / pi;

h = ifft(H);
k = 0:(N - 1);


%% Grafico de las se�ales:

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



