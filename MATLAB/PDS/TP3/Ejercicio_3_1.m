%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo:    Ejercicio_3_1.m
%
%   Enunciado: Implemente una rutina que calcule la Transformada de Fourier Discreta (DFT) en forma Rápida (FFT) mediante el 
%   algoritmo de Cooley & Tuckey. Tenga presente que la cantidad de muestras de la señal digital que desea transformar, debe ser
%   múltiplo de 2. La misma rutina debe permitir calcular la Transformada Inversa.
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Señales(PDS)
%   Departamento de Ing.Electrónica.
%   Facultad Buenos Aires
%   Universidad Tecnológica Nacional
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Inicialización:

clc;                        % Limpio el workspace
close all;                  % Cierro todas las figuras
clear all;                  % Cierro todas las variables


%% Cargo las señales de prueba:

% x = [0.3535 0.3535 0.6464 1.0607 0.3535 -1.0607 -1.3535 -0.3535];

A = 1;
f = 1000;
t0 = 0;
N = 128;
Fs = 10000;

[x t] = mySinc(A, f, t0, N, Fs);

%% Contrasto mi algoritmo contra el de matlab:


Ts = 0.1;

X_control = abs(fft(x));
X_prueba = abs(my_fft(x));

%% Muestro las señales en gráficos:

fig0 = figure();

subplot(2, 1, 1);
titulo = 'my__fft';
xlab = 't';
ylab = 'my__fft(x)';
PlotTiempo(X_prueba, t, titulo, xlab, ylab, 0, '-g');
% plot(X_prueba);

subplot(2, 1, 2);
titulo = 'fft';
xlab = 't';
ylab = 'fft(x)';
PlotTiempo(X_control, t, titulo, xlab, ylab, 0, '-g');
% plot(X_control);