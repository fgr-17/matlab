%%=========================================================================
%   
%>  @file   Script_Ejemplo_C2.m
%
%>  @brief  Síntesis de una señal cuadrada a diferentes frecuencias
%>  @brief  respecto de la frecuencia de Nyquist. 
%
%>  @date       08/04/2014
%
%>  @author     Federico Roux (froux@favaloro.edu.ar)
%>  @company    Laboratorio de uP. Universidad Favaloro 
%==========================================================================

%% Inicialización del script

clc;
close all;
clear all;

%% Parámetros generales:

A = 1;                                                                      % Amplitud de la señal
N = 128;                                                                    % Cantidad de muestras
duty = 50;                                                                  % Ciclo de trabajo
Fs = 1000;                                                                  % Frecuencia de muestreo

%% Genero la primer señal a mostrar: sin aliasing

f0_1 = 10;                                                                  % Frecuencia fundamental
[c1 t1] = sCuadrada(A, f0_1, N, duty, Fs);                                  % Genero señal

%% Genero la segunda señal a mostrar: sin aliasing

f0_2 = 50;                                                                  % Frecuencia fundamental
[c2 t2] = sCuadrada(A, f0_2, N, duty, Fs);                                  % Genero señal

%% Genero la tercer señal a mostrar: sin aliasing

f0_3 = 450;                                                                  % Frecuencia fundamental
[c3 t3] = sCuadrada(A, f0_3, N, duty, Fs);                                  % Genero señal


%% Grafico las señales obtenidas

NFil = 3;
NCol = 2;

subplot(NFil, NCol, 1);
Grafico_Temporal(c1, Fs, 0, 'Cuadrada', 't[s]', 'y', '-b', 0, 's/Aliasing');
subplot(NFil, NCol, 2);
Grafico_Frecuencial(c1, Fs, '-r', 2, NFil, NCol, 2);

subplot(NFil, NCol, 3);
Grafico_Temporal(c2, Fs, 0, 'Cuadrada', 't[s]', 'y', '-b', 0, 'Aliasing');
subplot(NFil, NCol, 4);
Grafico_Frecuencial(c2, Fs, '-r', 2, NFil, NCol, 4);

subplot(NFil, NCol, 5);
Grafico_Temporal(c3, Fs, 0, 'Cuadrada', 't[s]', 'y', '-b', 0, 'Aliasing');
subplot(NFil, NCol, 6);
Grafico_Frecuencial(c3, Fs, '-r', 2, NFil, NCol, 6);