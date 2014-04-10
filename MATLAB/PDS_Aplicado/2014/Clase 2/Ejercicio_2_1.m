%% ========================================================================
%
%>  @file Ejercicio_2_1.m
%
%>  @brief Resolución del ejercicio 2.1 TP de Laboratorio de uP.
%
%
%>  @author     Roux, Federico G. (froux@favaloro.edu.ar)
%>  @date       04/2013
%>  @company    UNIVERSIDAD FAVALORO
% =========================================================================

%% Inicializo la función 

clc;                                                                        % Limpio la pantalla
clear all;                                                                  % Limpio todas las variables 
close all;                                                                  % Cierro todas las ventanas de figuras, etc.

%% Guardo los parámetros fijos del ejercicio :

Fs = 1000;
A = 1;
ph0 = 0;

%% Primer set de valores a analizar:
f0_1 = 100;
N_1 = 100;

r_esp_1 = Fs / N_1;    

[s1 t1] = sSenoidal(A, f0_1, ph0, N_1, Fs);

%% 2do set de valores a analizar:

f0_2 = 100;
N_2 = 128;
r_esp_2 = Fs / N_2; 
[s2 t2] = sSenoidal(A, f0_2, ph0, N_2, Fs);

%% 3er set de valores a analizar:

f0_3 = 145;
N_3 = 100;
r_esp_3 = Fs / N_3;
[s3 t3] = sSenoidal(A, f0_3, ph0, N_3, Fs);


%% Grafico las señales sintetizadas:

NFils = 3;
NCols = 2;

subplot(NFils, NCols, [1]);
Grafico_Temporal(s1, Fs, 0, 'f0 = 100Hz N = 100', 't[s]', 'y', '-g', 0, 'Muestreo y Alias');
subplot(NFils, NCols, 2);
Grafico_Frecuencial(s1, Fs, '-b', 2 , NFils, NCols, 2);


subplot(NFils, NCols, [3]);
Grafico_Temporal(s2, Fs, 0, 'f0 = 100Hz N = 128', 't[s]', 'y', '-g', 0, 'Muestreo y Alias');
subplot(NFils, NCols, 4);
Grafico_Frecuencial(s2, Fs, '-b', 2 , NFils, NCols, 4);

subplot(NFils, NCols, 5);
Grafico_Temporal(s2, Fs, 0, 'f0 = 145Hz N = 128', 't[s]', 'y', '-g', 0, 'Muestreo y Alias');
subplot(NFils, NCols, 6);
Grafico_Frecuencial(s2, Fs, '-b', 2 , NFils, NCols, 6);


