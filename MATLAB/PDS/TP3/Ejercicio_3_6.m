% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_3_6.m
%
%   Enunciado: 6. Una se�al a[n] tiene una secuencia inversa a-1[n] = b[n] si 
%   se cumple que a[n]*b[n]= d[n]. Por medio de la Transformada Discreta de Fourier
%   y su correspondiente inversa, encuentre la secuencia a-1[n]= b[n] de la secuencia
%   a[n] =  d[n] - (1/2)d[n - 1]. Verifique el resultado obtenido convolucionando 
%   la secuencia a[n] con la b[n] obtenida.
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Se�ales(PDS)
%   Departamento de Ing.Electr�nica.
%   Facultad Buenos Aires
%   Universidad Tecnol�gica Nacional
%
% -------------------------------------------------------------------------

%% Inicializaci�n:

clc;                                                                        % Limpio el workspace
close all;                                                                  % Cierro todas las figuras
clear all;                                                                  % Cierro todas las variables

%% Inicializaci�n de se�ales a usar:

a_n = [1 -0.5];                                                             % Se�al original
A_n = fft(a_n);                                                             % FFT de la funci�n a_n

d_n = [1 0];                                                                % Funci�n Delta
D_n = fft(d_n);                                                             % Transformada de la funci�n delta

B_n = D_n ./ A_n;                                                           % Transformada de la funci�n inversa

b_n = ifft(B_n);                                                            % Transformada inversa de la funci�n B_n inversa de a_n

