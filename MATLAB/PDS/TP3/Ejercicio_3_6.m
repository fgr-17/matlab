% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_3_6.m
%
%   Enunciado: 6. Una señal a[n] tiene una secuencia inversa a-1[n] = b[n] si 
%   se cumple que a[n]*b[n]= d[n]. Por medio de la Transformada Discreta de Fourier
%   y su correspondiente inversa, encuentre la secuencia a-1[n]= b[n] de la secuencia
%   a[n] =  d[n] - (1/2)d[n - 1]. Verifique el resultado obtenido convolucionando 
%   la secuencia a[n] con la b[n] obtenida.
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

a_n = [1 -0.5];                                                             % Señal original
A_n = fft(a_n);                                                             % FFT de la función a_n

d_n = [1 0];                                                                % Función Delta
D_n = fft(d_n);                                                             % Transformada de la función delta

B_n = D_n ./ A_n;                                                           % Transformada de la función inversa

b_n = ifft(B_n);                                                            % Transformada inversa de la función B_n inversa de a_n

