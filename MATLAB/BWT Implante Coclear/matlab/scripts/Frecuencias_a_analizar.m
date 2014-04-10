% -------------------------------------------------------------------------
%
%   Archivo:    Frecuencias_a_analizar.m
%
%   Descripcion: Se generan las frecuencias centrales a analizar y las
%   onditas asociadas a cada una.
%
% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%               EN LUGAR DE ESTO USO LA FUNCIÓN "Bandas_ERB.m"
% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: Ing. BRUNO, Julian S. 
%   RT-DSP, Departamento de Ing.Electronica.
%   UTN.BA
%
% -------------------------------------------------------------------------

%% Inicializacion:

clc;                                                                        % Limpio el workspace
close all;                                                                  % Cierro todas las figuras
clear all;                                                                  % Cierro todas las variables

%% Parámetros del script:

Fs = 11025;                                                                 % [Hz] Frecuencia de muestreo luego de submuestrear 
f0 = 15165.4;                                                               % [Hz] Frecuencia central de la función
q = 1.1623;                                                                 % Divisor de la ecuación
n = 1:22;                                                                   % Valores del exponente del divisor.

fi = f0 ./(q.^n);                                                            % [Hz] Valores frecuenciales a analizar

%% Muestro resultados en el command window:
fprintf('Frecuencias a analizar por las wavelet:\n\n');
for i = 1:22
    fprintf('F%d = %f [Hz]\n', n(i), fi(i));
end

