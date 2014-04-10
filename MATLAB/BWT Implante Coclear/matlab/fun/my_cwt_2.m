% -------------------------------------------------------------------------
%
%   Archivo:        my_cwt.m
%
%   Descripción:    versión propia del algoritmo de CWT haciendo
%   directamente la convolución de la señal con la wavelet. NO FUNCIONA
%   BIEN
%
%   Autor:          ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Señales(PDS)
%   Departamento de Ing.Electrónica.
%   Facultad Buenos Aires
%   Universidad Tecnológica Nacional
%
% -------------------------------------------------------------------------


function [y] = my_cwt_2(x, escalas, wavelet)

N = size(x, 2);                                                     % Longitud de la señal
% L = size(wavelet, 2);                                             % Longitud de la ondita
L = 1024;

escalas_N = size(escalas, 2);                                       % Cantidad de escalas a evaluar
b = (L - 1)/2;

y = zeros(escalas_N, N);

[w0 t] = wavelet(1, b, L);                                          % Genero la wavelet completa
dt = t(2) - t(1);                                                   % Calculo la Ts de la Wavelet
w0T = t(L) - t(1);                                                  % soporte completo de la ondita

for i = 1:escalas_N
    
    a = escalas(i);                                                 % Guardo en 'a' la escala a procesar
    
    j = 0:(w0T * a);                                                % Me quedo con las muestras señaladas por la escala
    j = j / (a * dt);                                               % haciendo una decimación (submuestreo).
    j = 1 + floor(j);         
    
    wsub = w0(j);                                                   % Decimación de la wavelet
            
    yt = myConv(x, wsub);                                           % Hago la convolución entre la señal y la wavelet    
    y(i, :) = -sqrt(1/a) * wkeep1(yt, N);                             % Me quedo con la parte central
       
end
    
end 
 