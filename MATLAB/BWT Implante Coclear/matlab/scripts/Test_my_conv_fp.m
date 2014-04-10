%> \file Ejercicio5A.m
%> \brief 	script del Ejercicio 5A
%> \author Federico G. Roux (rouxfederico@gmail.com)
%> \author UTN FRBA - DSPRT
%> \date 06.05.2010
%> \version 1.0.0	
%> \note: TP#2: Ejercicio 5B
%--------------------------------------------------------------------------

%> \brief Compara la convoluci�n implementada con la de MATLAB
%> \warning
%> \bug
%> \todo

%% Inicializaci�n previa
close all;
clc;

%% Definici�n de las funciones

% Parámetros de la se�al pulso1
%{
A = 0.01;
t0a = 5;
t1a = 8;
Nsamples = 100;

[pulso1 t]=myPulse(A,t0a,t1a,Nsamples,fs);     % Genero el 1er Pulso
%}

Fs = 16000;
N = 64;

A1 = 0.5;           A2 = 0.5;
f01 = 0.5e3;        f02 = 0.8e3;
ph01 = 0;           ph02 = 0;

% h = Cuadrada(4*N, 1, N, 50, Fs);


% Par�metros de la se�al pulso2
%{
A2 = 0.02;
t0b = 2;
t1b = 4;
Nsamples2 = 100;

[pulso2 t2] = myPulse(A2, t0b, t1b, Nsamples2, fs);
%}

A2 = 0.4;
f0 = Fs/4;
%   [x t] = mySin(A2, f0, 0, N, Fs);


% ---- Convoluci�n de las Señales: -----
                                                                            % 1) Convolucion en Punto Fijo
ModoOverFlow = 'Saturate';                                                  % Parámetros del sistema numérico utilizado
WL = 16;                                                                    % Wordlength
FL = 15;                                                                    % Fraclength

[conv_int Nconv] = my_conv_fp(h,x_fp);
[conv_float Nconv] = myConv(h_fl,x_fl);                                     % 2) Convolución en Punto Flotante con máxima resolución:

t_conv = 1 : Nconv;                                                         % 3) Eje temporal
t_conv = t_conv * (1/Fs); 

conv_error = abs(conv_float - conv_int.data);                               % señal de error generado

%% Gr�fico de las se�ales

                                                                            % Parámetros del gr�fico                                                                           
NF = 4;                                                                     % Cantidad de filas
NC = 1;                                                                     % Cantidad de columnas

                                                                            
subplot(NF, NC, 1);                                                         % ------ Grafico tiempo de la convoluci�n en FI: ----
conv_intPlot = conv_int.data;
PlotTiempo(conv_intPlot, t_conv, 'Convolución en Punto Fijo', 'n', 'pA[n]*pB[n]', 1, '.r');
                                                                           
subplot(NF, NC, 2);                                                         % ------ Grafico tiempo de la convolución en Float: ----
PlotTiempo(conv_float, t_conv, 'Convolución en Float', 'n', 'pA[n]*pB[n]', 1, '.g');

%% Gráfico de error

% FracLenght = 15;                                                          % Tamaño de la parte fraccionaria
maxError = 2^(- FL);                                                        % Máximo error de cuantizaci�n.
bins = 0 : maxError/10 : maxError;                                          % Bins para realizar el histograma

subplot(NF, NC, 3);
PlotTiempo(conv_error, t_conv, 'Error absoluto de la convoluci�n en punto Fijo', 'n', 'Err[n]', 1, '.b');

subplot(NF,NC,4);

[barras rangos] = hist(conv_error); %,bins);
barras = barras(2 : size(barras, 2));
rangos = rangos(2 : size(rangos, 2));

bar(rangos, barras);
xlabel('Error');
ylabel('Frecuencia de error');

title('Histograma de los valores de error producidos por la convoluci�n en Punto Fijo');

%% Almacenamiento de im�genes y se�ales:
% saveas(gcf,[imagenesPath 'convFI.png']);    % guardo la �litma imagen
