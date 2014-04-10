% -------------------------------------------------------------------------
%
%   Archivo:        my_cwt.m
%
%   Descripci�n:    versi�n propia del algoritmo de CWT haciendo
%   directamente la convoluci�n de la se�al con la wavelet. NO FUNCIONA
%   BIEN
%
%   Autor:          ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Se�ales(PDS)
%   Departamento de Ing.Electr�nica.
%   Facultad Buenos Aires
%   Universidad Tecnol�gica Nacional
%
% -------------------------------------------------------------------------


function [y] = my_cwt_2(x, escalas, wavelet)

N = size(x, 2);                                                     % Longitud de la se�al
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
    
    j = 0:(w0T * a);                                                % Me quedo con las muestras se�aladas por la escala
    j = j / (a * dt);                                               % haciendo una decimaci�n (submuestreo).
    j = 1 + floor(j);         
    
    wsub = w0(j);                                                   % Decimaci�n de la wavelet
            
    yt = myConv(x, wsub);                                           % Hago la convoluci�n entre la se�al y la wavelet    
    y(i, :) = -sqrt(1/a) * wkeep1(yt, N);                             % Me quedo con la parte central
       
end
    
end 
 