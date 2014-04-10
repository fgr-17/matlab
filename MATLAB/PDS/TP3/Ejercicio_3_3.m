% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_3_3.m
%
%   Enunciado: Implementar una rutina que permita aplicar a una señal a ser 
%   filtrada, distintas ventanas de visualización. A su vez, estas ventanas 
%   pueden ser aplicadas en el espectro de la frecuencia para de esta forma 
%   observar en el dominio discreto del tiempo su efecto sobre la señal 
%   transformada. Las ventanas a implementar son:
%
%           - Hanning
%           - Hamming
%           - Bartlett
%           - Blackman
%           - Triangular
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

clc;                                                                            % Limpio el workspace
close all;                                                                      % Cierro todas las figuras
clear all;                                                                      % Cierro todas las variables

%% Cargo las señales de prueba:

Fs = 1000;
L = 128;

x_Am = 0.8;                                                                     % Am  : Amplitud pico de la señal modulante.
x_Ac = 0.4;                                                                     % Ac  : Amplitud pico de la señal portadora.
x_fm = 100;                                                                     % fm  : frecuencia de la señal modulante.
x_fc = 600;                                                                     % fc  : frecuencia de la señal portadora
[x xT] = myAM(x_Am, x_Ac, x_fm, x_fc, L, Fs);                                   % Señal de AM 1

y_Am = 1;                                                                       % Am  : Amplitud pico de la señal modulante.
y_Ac = 0.2;                                                                     % Ac  : Amplitud pico de la señal portadora.
y_fm = 10;                                                                      % fm  : frecuencia de la señal modulante.
y_fc = 1000;                                                                    % fc  : frecuencia de la señal portadora
[y yT] = myAM(y_Am, y_Ac, y_fm, y_fc, L, Fs);                                   % Señal de AM 2 

% z = y + x;                                                                    % Señal original: suma de 4 tonos
x = mySin(1, 250, 0, 128, 1000);
y = Cuadrada(L, 1, L, 50, Fs);                                                  % Señal a procesar

z = x.*y;

%% Aplico diferentes ventanas

z_rect = z;                                                                     % Ventana Rectangular
z_hanning = my_Hanning_Win(z);                                                  % Ventana de Hanning
z_hamming = my_Hamming_Win(z);                                                  % Ventana de Hamming
z_bartlett = my_Bartlett_Win(z);                                                % Ventana de Bartlett
z_blackman = my_Blackman_Win(z);                                                % Ventana de Blackman
z_triangular = my_Triangular_Win(z);                                            % Ventana de Triangular

%% Grafico los resultados:

fig0 = figure();
NF = 6;
NC = 2;

subplot(NF, NC, 1);
titulo = 'Ventana Rectangular';
xlab = 't';
ylab = 'Rectangular';
PlotTiempo(z_rect, yT, titulo, xlab, ylab, 0, '-g');
subplot(NF, NC, 2);
PlotFFT(z_rect, Fs, titulo, 0, ylab);

subplot(NF, NC, 3);
titulo = 'Ventana Hanning';
xlab = 't';
ylab = 'Hanning';
PlotTiempo(z_hanning, yT, titulo, xlab, ylab, 0, '-g');
subplot(NF, NC, 4);
PlotFFT(z_hanning, Fs, titulo, 0, ylab);

subplot(NF, NC, 5);
titulo = 'Ventana Hamming';
xlab = 't';
ylab = 'Hamming';
PlotTiempo(z_hamming, yT, titulo, xlab, ylab, 0, '-g');
subplot(NF, NC, 6);
PlotFFT(z_hamming, Fs, titulo, 0, ylab);

subplot(NF, NC, 7);
titulo = 'Ventana Bartlett';
xlab = 't';
ylab = 'Bartlett';
PlotTiempo(z_bartlett, yT, titulo, xlab, ylab, 0, '-g');
subplot(NF, NC, 8);
PlotFFT(z_bartlett, Fs, titulo, 0, ylab);

subplot(NF, NC, 9);
titulo = 'Ventana Blackman';
xlab = 't';
ylab = 'Blackman';
PlotTiempo(z_blackman, yT, titulo, xlab, ylab, 0, '-g');
subplot(NF, NC, 10);
PlotFFT(z_blackman, Fs, titulo, 0, ylab);

subplot(NF, NC, 11);
titulo = 'Ventana Triangular';
xlab = 't';
ylab = 'Triangular';
PlotTiempo(z_triangular, yT, titulo, xlab, ylab, 0, '-g');
subplot(NF, NC, 12);
PlotFFT(z_triangular, Fs, titulo, 0, ylab);

