%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo: my_Gabor_Win_2.m
%
%   function my_Gabor_Win_2
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Se�ales(PDS)
%   Departamento de Ing.Electr�nica.
%   Facultad Buenos Aires
%   Universidad Tecnol�gica Nacional
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [w tw] = my_Gabor_Win_2(alfa, a, t0, N, Fs)

    Ts = 1 / Fs;                                            % Frecuencia de muestreo

    t = 0:(N - 1);                                          % Array de n�mero de muestras
    t = t * Ts;        
    t = t - t0;
    
    tw = t;
    t = t / a;

    k0 = 1 / (2 * (pi * alfa)^(1/2));
    t2 = t.^2;
    
    w = k0 * exp(-t2/(4 * alfa));
        
    w_sum = sum(w);                                         % Sumatoria de los valores de w
    w = w/w_sum;                                            % Normalizo para el valor 1

end