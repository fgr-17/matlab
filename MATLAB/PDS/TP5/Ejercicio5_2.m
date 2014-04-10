%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo:    Ejercicio5_2.m
%
%   Enunciado:  A partir de un Filtro Pasa Bajos RC de primer orden con 
%   fp=60 Hz, muestreado con una frecuencia fs=1KHz, mediante la técnica de
%   minimización de cuadrados mínimos para Filtros Recursivos Adaptativos, 
%   se pide calcular las componentes RC que le dieron origen al filtro RC 
%   si la señal de entrada es x(t) = 2·sen(2.pi.50.t)+ sen(2.pi.300.t) . 
%   Realice todos los cálculos diseñando una función en MatLab para tal 
%   efecto.
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Señales(PDS)
%   Departamento de Ing.Electrónica.
%   Facultad Buenos Aires
%   Universidad Tecnológica Nacional
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Inicialización:

clc;                        % Limpio el workspace
close all;                  % Cierro todas las figuras
clear all;                  % Cierro todas las variables

%% Datos del enunciado:

fs = 1e3;                   % Frecuencia de muestreo        [Hz]
Ts = 1/fs;                  % Período de muestreo           [s]

fc = 60;                    % Frecuencia de corte del filtro[Hz]
wc = 2*pi*fc;               % Pulsación de corte            [rad/s]

xN = 500;                  % Cantidad de muestras de la señal de entrada

% Parámetros de la primer señal
A_1  = 2;                   % Amplitud 
f0_1 = 50;                  % Freq. fundamental
ph0_1 = 0;                  % Fase de la señal

[sen_1 t] = mySin(A_1, f0_1, ph0_1, xN, fs);        % Primer frecuencia

% Parámetros de la segunda señal
A_2  = 1;                   % Amplitud 
f0_2 = 300;                 % Freq. fundamental
ph0_2 = 0;                  % Fase de la señal

sen_2 = mySin(A_2, f0_2, ph0_2, xN, fs);        % 2da frecuencia


x = sen_1 + sen_2;          % Señal de entrada del filtro

%% Resolución del ejercicio:
%
% Lo primero que hago es hallar la señal deseada d[n], a la que el filtro
% tiene que adaptar la señal x(t). Esta señal d[n] es la que sale de
% filtrar la versión discreta de la señal x(t) con el filtro. La expresión
% del filtro, en su transformada de Laplace es:
%
%           2.pi.fc 
%   H(s) = -----------
%          s + 2.pi.fc
%
% Ordenando los coeficientes en un array me queda:

%{
N = [0  wc];            % Coeficientes del numerador
D = [1  wc];            % Coeficientes del denominador

[B A] = bilinear(N, D, fs); % Transformada bilinear para hallar H(z) a fs
%}

% Transformada Z de un filtro RC analógico:
B = [wc wc] / (2*fs + wc);
A = [1  (-2*fs + wc)/(2*fs + wc)];

d = filter(B, A, x);

% Una vez que tengo la señal de entrada y la deseada, elijo el orden del
% filtro y la velocidad de convergencia, y hago el procesamiento LMS:

x_fft = fft(x);
x_pot = sum(abs(x_fft).^2) ^ (0.5);

orden = 1;
mu = 200/(20 * orden * x_pot);

[Bk Ak yk ek] = Adaptar_Coeficientes_IIR(x, d, orden, mu);

% Desarrollando la transformada bilinear de un filtro RC analógico
% muestreado a una frecuencia fs, me quedan las siguientes expresiones (sin
% tener en cuenta la multiplicación por una constante):
%
%   b0 = wc /(2*fs + wc)      
%   b1 = wc /(2*fs + wc)
%   a0 =  1;
%   a1 = (-(2*fs) + wc)/(2*fs + wc);

fc_m = (2*fs*Bk(1)) / (2*pi*(1 - Bk(1)));



%% Devuelvo los resultados del algoritmo por consola

disp('Los coeficientes del numerador son:');
linea1 = sprintf( '%d\n', Bk);
disp(linea1);

disp('Los coeficientes del denominador son:');
linea2 = sprintf( '%d\n', Ak);
disp(linea2);

disp('La frecuencia de corte del filtro adaptado es:');
linea3 = sprintf( '%.2f[Hz]\n', fc_m);
disp(linea3);



%% Gráfico las señales de trabajo
fig1 = figure();    % Obtengo el handler de la figura
rotulo = sprintf('Filtro Adaptativo mu = %f. fs = %dkHz. Identificación de un filtro RC con una senoidal', mu, fs/1000);
set(fig1,'name',rotulo);

NF = 4;             % Cantidad de filas del gráfico
NC = 2;             % Cantidad de columnas del gráfico

subplot(NF, NC, 1);
PlotTiempo(x, t, 'Señal de entrada x[n]', 't', 'x[n]', 0, 'g');
subplot(NF, NC, 2);
PlotFFT(x, fs, 'Espectro de la señal de entrada X[k]', 1, 'X[k]');

subplot(NF, NC, 3);
PlotTiempo(d, t, 'Señal deseada d[n]', 't', 'd[n]', 0, 'g');
subplot(NF, NC, 4);
PlotFFT(d, fs, 'Espectro de la señal de deseada D[k]', 1, 'D[k]');

subplot(NF, NC, 5);
PlotTiempo(yk, t, 'Señal filtrada y[n]', 't', 'y[n]', 0, 'g');
subplot(NF, NC, 6);
PlotFFT(yk, fs, 'Espectro de la señal filtrada Y[k]', 1, 'Y[k]');

subplot(NF, NC, [7 8]);
PlotTiempo(ek, t, 'Señal de error e[n]', 't', 'e[n]',0, 'g');




