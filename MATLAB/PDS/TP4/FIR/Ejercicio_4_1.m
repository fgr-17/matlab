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

N = 67 ;                                                                    % Cantidad de coeficientes del filtro
t0 = (N - 1)/2;                                             
ventana = 'rectangular';                                                    % Ventana usada para los filtros

%------------------------------------------------ Ejercicio a ------------------------------------------------

fs_a = 8e3;                                                                 % Fs = 8kHz
fc_a = 1e3;                                                                 % frecuencia de corte en 1kHz

[Ha ta] = LPF_FIR_Ventana(fc_a, N, fs_a, ventana);                          % Obtengo los coeficientes del filtro

%------------------------------------------------ Ejercicio b ------------------------------------------------

fs_b = 5e3;                                                                 % Fs = 8kHz
fc_b = 3e3;                                                                 % frecuencia de corte en 1kHz

[Hb tb] = HPF_FIR_Ventana(fc_b, N, fs_b, ventana);                          % La función me genera los coeficientes del filtro

%------------------------------------------------ Ejercicio c ------------------------------------------------

fs_c = 8e3;                                                                 % Fs = 8kHz
f1_c = 1e3;                                                                 % Inicio de banda de paso
f2_c = 2e3;                                                                 % Fin de banda de paso

[Hc tc] = BPF_FIR_Ventana(f1_c, f2_c, N, fs_c, ventana);

%------------------------------------------------ Ejercicio d ------------------------------------------------

fs_d = 8e3 ;                                                                % Fs = 5kHz
f1_d = 1e3 ;                                                                % Inicio de banda de eliminación
f2_d = 2e3;                                                                 % Fin de banda de eliminación

[Hd td] = BEF_FIR_Ventana(f1_d, f2_d, N, fs_d, ventana);


%% Grafico los resultados:

NF = 4;
NC = 4;

%------------------------------------------------ Ejercicio a ------------------------------------------------

titulo = 'Ejercicio a) LPF fc=1kHz';
xlab = 'k';
ylab = 'h[k]';
mode = 1;
color = '-g';
subplot(NF, NC, 1); PlotTiempo(Ha, ta, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 2); PlotFFT(Ha, fs_a, 'Modulo lineal del filtro', 0, 'Ha[k]');
PlotFFT2(Ha, fs_a, '.b', 1,NF, NC, 3);

%------------------------------------------------ Ejercicio b ------------------------------------------------

titulo = 'Ejercicio b) HPF fc=3kHz (ALIAS)';
xlab = 'k';
ylab = 'h[k]';
mode = 1;
color = '-g';

subplot(NF, NC, 5); PlotTiempo(Hb, tb, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 6); PlotFFT(Hb, fs_b, 'Modulo lineal del filtro', 0, 'Hb[k]');
PlotFFT2(Hb, fs_b, '.b', 1,NF, NC, 7);

%------------------------------------------------ Ejercicio c ------------------------------------------------

titulo = 'Ejercicio c) BPF PW=1-2kHz';
xlab = 'k';
ylab = 'h[k]';
mode = 1;
color = '-g';

subplot(NF, NC, 9); PlotTiempo(Hc, tc, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 10); PlotFFT(Hc, fs_c, 'Modulo lineal del filtro', 0, 'Hc[k]');
PlotFFT2(Hc, fs_c, '.b', 1,NF, NC, 11);

%------------------------------------------------ Ejercicio d ------------------------------------------------

titulo = 'Ejercicio d) EPF BW=1-2kHz';
xlab = 'k';
ylab = 'h[k]';
mode = 1;
color = '-g';
subplot(NF, NC, 13); PlotTiempo(Hd, td, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 14); PlotFFT(Hd, fs_d, 'Modulo lineal del filtro', 0, 'Hd[k]');
PlotFFT2(Hd, fs_d, '.b', 1,NF, NC, 15);
