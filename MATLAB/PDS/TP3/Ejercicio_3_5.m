% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_3_5.m
%
%   Enunciado: 5. Verifique la propiedad de desplazamiento circular
%   anterior, por definición y mediante el uso de la Transformada Discreta
%   de Fourier, siendo la señal de entrada a = [1 3 5 7 5 3 1], con un 
%   desplazamiento circular n0 = 4
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

%% Inicialización de señales a usar:

a_k = [1 3 5 7 5 3 1];                                                      % Señal original
n0 = -4;                                                                    % Rotación de la señal
b_k = circshift(a_k, [1 n0]);                                               % Señal rotada circularmente
A_k = fft(a_k);                                                   % Calculo el espectro de la señal original

% La propiedad de desplazamiento circular dice lo siguiente:
%   g[n] = x([n + n0])N <----> G[k] = X[k].e^+j(2*PI*n0*k/N)

N = size(a_k, 2);                                                           % Largo de la señal
k = 0:(N - 1);                                                              % Array de índices k

Ts = 1;                                                                     % Período de muestreo
Fs = 1/Ts;                                                                  % Frecuencia de muestreo
yT = k * Ts;                                                                % Array de tiempo
% yk = k - (N / 2);                                                           % Corro el array al centro

B_k = A_k .* exp(-(1i*2*pi*n0*k)/N);                                        % Señal desfasada en el espectro

B_k_mod = abs(B_k);                                                         % Modulo del espectro
B_k_fas = angle(B_k);                                                       % Fase del espectro

%% Grafico las señales:

fig0 = figure();
NF = 3;
NC = 3;

subplot(NF, NC, 1);
titulo = 'Señal original';
xlab = 't';
ylab = 'a[k]';
PlotTiempo(a_k, yT, titulo, xlab, ylab, 1, '.b');
PlotFFT2(a_k, Fs, '-b', 1, NF, NC, 2);
        
subplot(NF, NC, 4);
titulo = 'Señal rotada circularmente n0 = 4';
xlab = 't';
ylab = 'a[k - n0]';
PlotTiempo(b_k, yT, titulo, xlab, ylab, 1, '.b');
PlotFFT2(b_k, Fs, '-b', 1, NF, NC, 5);

subplot(NF, NC, 7);
titulo = 'Señal calculada por espectro desfasado';
xlab = 't';
ylab = 'a[k - n0]';
PlotTiempo(b_k, yT, titulo, xlab, ylab, 1, '.b');
subplot(NF, NC, 8);
PlotTiempo(B_k_mod, k, titulo, 'f[Hz]', 'A[k]*exp()', 0, '-b');
subplot(NF, NC, 9);
PlotTiempo(B_k_fas, k, titulo, 'f[Hz]', 'A[k]*exp()', 0, '-b');