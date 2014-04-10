%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo: my_fft.m
%
%   function X_k = my_fft(x_k)
%
%   Parámetros de Entrada : * x_k : Señal a procesar. Tiene que tener un
%   largo que sea potencia de 2.
%
%   Parámetros de salida : X_k : FFT de la señal de entrada
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Señales(PDS)
%   Departamento de Ing.Electrónica.
%   Facultad Buenos Aires
%   Universidad Tecnológica Nacional
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [X_k] = my_fft(x_k)

xN = size(x_k, 2);                                                      % Calculo el largo de la cadena de entrada

if (xN == 1)
    X_k = x_k(1);                                                       % La DFT de una muestra es la misma muestra
else
    WN = exp(-2*pi*1i/xN);
    ind = 1 : xN;                                                       % array de índices
    ind_impar = boolean(rem(ind, 2));                                   % obtengo los índices pares
    ind_par = not(ind_impar);                                           % obtengo los impares
        
    x_impar = x_k(ind_par);
    x_par = x_k(ind_impar);
    
    G_k = my_fft(x_par);                                                % hago la dft de las muestras pares
    H_k = my_fft(x_impar);                                              % hago la dft de las muestras impares
    
    X_k(1 : (xN/2))       = G_k + H_k .* WN.^(0:(xN/2 - 1));
    X_k(((xN/2) + 1): xN) = G_k + H_k .* WN.^((xN/2): xN - 1);       
end 

end