%% =======================================================================
%>  @file       Relacion_Frecuencia_Escala.m
%
%>  @brief      mido la f0 de wavelets morlet a todas las escalas
%>  @brief      posibles con un N = 1024.
%
%>  @author     Federico Roux (rouxfederico@gmail.com)
%>  @company    RT-DSP UTN.BA
% =======================================================================-

%% Inicialización del Script

clc;
close all;
clear all;

%% Parámetros para generar la wavelet Morlet
tini = -8;                                                                  % Inicio del soporte de la wavelet
tfin = 8;                                                                   % Final del soporte de la wavelet
N = 1024;                                                                   % Cantidad de muestras

soporte = tfin - tini;                                                      % soporte de la wavelet Morlet

Ts = soporte / (N - 1);                                                     % Período de muestreo
%Fs = 1 / Ts;                                                                % Frecuencia de muestreo

[w t] = my_Morlet(tini, tfin, N);                                           % Genero la primer wavelet completa

%% Escalo la wavelet en todas sus posibilidades

aN = 10;                                                                    % Cantidad de escalas posibles
aMin = 1;                                                                   % Mínima escala posible con todas las muestras

% a = (2.^(0:10))/16;
% a = ceil((1:1024)/16);
a_exp = 1:aN;                                                               % Array 
a = 2.^a_exp;
Fs = 16000;                                                                 % FUERZO LA Fs A LA QUE SE MUESTREA

fasc = zeros(1, 1024);                                                      % Inicializo el array de frecuencias

for i = 1 : 1024                                                            % Recorro todas las escalas generadas
     [w_sub t_eje]  = Escalar_Wavelet(w, t, a(i));   
               
     fasc(i)= Frecuencia_Asociada_Escala(w_sub, Fs, a(i));                      % Calculo la frecuencia asociada a la escala
     fprintf('ESCALA %.3f: Frecuencia central: %.2f [Hz]\n', a(i), fasc(i));
     
     subplot(1, 1, 1);
     Grafico_Frecuencial(w_sub, Fs, '-g', 2, 1, 2, 1);
     
     sKey = input('press any key to continue.','s');
end





