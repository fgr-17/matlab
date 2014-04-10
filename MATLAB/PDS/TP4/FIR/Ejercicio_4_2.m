% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_4_1.m
%
%   Enunciado: 1. Para cada una de las siguientes especificaciones de diseño, 
%   se pide implementar los FIR correspondientes mediante una ventana rectangular. 
%   En todos los caso el valor de N es 67. Se pide además graficar la respuesta 
%   al impulso de cada uno de ellos y la respuesta en frecuencia (lineal y 
%   semilogarítmica) para cada uno de ellos verificando su diseño. Utilice 
%   para estos gráficos MatLab.
%   a) Filtro Pasa Bajos con las siguientes características: Frecuencia de 
%      Muestreo fs de 8KHz; Banda de Paso: 0 – 1 KHz.
%   b) Filtro Pasa Altos con las siguientes características: Frecuencia de 
%      Muestreo fs de 5KHz; Banda de Paso: 3 – (inf) KHz.
%   c) Filtro Pasa Banda con las siguientes características: Frecuencia de 
%      Muestreo fs de 8KHz; Banda de Eliminación Inferior: 0 – 1 KHz; 
%      Banda de Paso: 1 – 2 KHz; Banda de Eliminación Superior: 2 – (inf) KHz.
%   d) Filtro Elimina Banda con las siguientes características: Frecuencia de 
%      Muestreo fs de 8 KHz; Banda de Paso Inferior: 0 – 1 KHz; Banda de 
%      Eliminación: 1 – 2 KHz; Banda de Paso Superior: 2 – (inf) KHz.
%   e) Reduzca el orden N de los filtros y observe como cambian las 
%      características de los filtros diseñados. ¿Qué puede concluir al respecto?
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

% ------------------------------------------------ Ejercicio a ------------------------------------------------

% Por ser la banda de eliminación 50dB, uso ventana de Hamming

fs_a = 8e3;                                                                 % Fs = 8kHz

fp_a = 1e3;                                                                 % Frecuencia de paso 1kHz
fc_a = 1.4e3;                                                               % Frecuencia de eliminación 1.4kHz

ft_a = (fp_a + fc_a)/2;                                                     % Frecuencia de transición
Bt_a = fc_a - fp_a;                                                         % Ancho de banda de transición en Hz
wt_a = 2*pi*Bt_a/fs_a;                                                      % Ancho de banda de transición en rad

N_a = ceil(6.6*pi/wt_a);                                                    % Cantidad de muestras por tabla
% win_a = 'hamming';                                                        % Ventana usada para los filtros
win_a = 'rectangular';

[Ha ta] = LPF_FIR_Ventana(ft_a, N_a, fs_a, win_a);                          % Obtengo los coeficientes del filtro

% ------------------------------------------------ Ejercicio b ------------------------------------------------

fs_b = 10e3;                                                                % Fs = 8kHz
fp_b = 3e3;                                                                 % Banda de paso 0 - 3kHz
fc_b = 3.5e3;                                                               % Banda de eliminación 3.5kHz - inf

ft_b = (fp_b + fc_b)/2;                                                     % Frecuencia de transición
Bt_b = fc_b - fp_b;                                                         % Ancho de banda de transición en Hertz
wt_b = 2*pi*Bt_b/fs_b;                                                      % Ancho de banda de transición en radianes

N_b = (11*pi)/wt_b;                                                         % Cantidad de muestras por tabla
win_b = 'blackman';                                                         % Ventana elegida por atenuar 70dB

[Hb tb] = HPF_FIR_Ventana(ft_b, N_b, fs_b, win_b);                          % La función me genera los coeficientes del filtro

%------------------------------------------------ Ejercicio c ------------------------------------------------

fs_c = 8e3;                                                                 % Fs = 8kHz

f1_c = 0.6e3;
f2_c = 1e3;
f3_c = 2e3;
f4_c = 2.6e3;

Bt1_c = f2_c - f1_c;
Bt2_c = f4_c - f3_c;

Bt_c = (Bt1_c + Bt2_c)/2;
wt_c = 2*pi*Bt_c/fs_c;

ft1_c = (f1_c + f2_c)/2;
ft2_c = (f3_c + f4_c)/2;

N_c = (6.2 * pi)/ wt_c;
win_c = 'hanning';

[Hc tc] = BPF_FIR_Ventana(ft1_c, ft2_c, N_c, fs_c, win_c);

%------------------------------------------------ Ejercicio d ------------------------------------------------

fs_d = 8e3 ;                                                                % Fs = 5kHz

f1_d = 0.6e3;
f2_d = 1e3;
f3_d = 2e3;
f4_d = 2.6e3;

Bt1_d = f2_d - f1_d;
Bt2_d = f4_d - f3_d;

Bt_d = (Bt1_d + Bt2_d)/2;
wt_d = 2*pi*Bt_d/fs_d;

ft1_d = (f1_d + f2_d)/2;
ft2_d = (f3_d + f4_d)/2;

N_d = (11 * pi)/ wt_c;
win_d = 'blackman';                                                             % Fin de banda de eliminación

[Hd td] = BEF_FIR_Ventana(ft1_d, ft2_d, N_d, fs_d, win_d);


%% Grafico los resultados:

NF = 4;
NC = 4;

%------------------------------------------------ Ejercicio a ------------------------------------------------

titulo = 'a)LPF Hamming';
xlab = 'k';
ylab = 'h[k]';
mode = 1;
color = '-g';
subplot(NF, NC, 1); PlotTiempo(Ha, ta, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 2); PlotFFT(Ha, fs_a, 'Modulo lineal del filtro', 0, 'Ha[k]');
PlotFFT2(Ha, fs_a, '.b', 1,NF, NC, 3);

%------------------------------------------------ Ejercicio b ------------------------------------------------

titulo = 'b)HPF Blackman';
xlab = 'k';
ylab = 'h[k]';
mode = 1;
color = '-g';

subplot(NF, NC, 5); PlotTiempo(Hb, tb, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 6); PlotFFT(Hb, fs_b, 'Modulo lineal del filtro', 0, 'Hb[k]');
PlotFFT2(Hb, fs_b, '.b', 1,NF, NC, 7);

%------------------------------------------------ Ejercicio c ------------------------------------------------

titulo = 'c)BPF Hanning';
xlab = 'k';
ylab = 'h[k]';
mode = 1;
color = '-g';

subplot(NF, NC, 9); PlotTiempo(Hc, tc, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 10); PlotFFT(Hc, fs_c, 'Modulo lineal del filtro', 0, 'Hc[k]');
PlotFFT2(Hc, fs_c, '.b', 1,NF, NC, 11);

%------------------------------------------------ Ejercicio d ------------------------------------------------

titulo = 'd)EPF Blackman';
xlab = 'k';
ylab = 'h[k]';
mode = 1;
color = '-g';
subplot(NF, NC, 13); PlotTiempo(Hd, td, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 14); PlotFFT(Hd, fs_d, 'Modulo lineal del filtro', 0, 'Hd[k]');
PlotFFT2(Hd, fs_d, '.b', 1,NF, NC, 15);
