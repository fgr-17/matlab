%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo: my_Gabor_Win.m
%
%   function my_Gabor_Win
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


function [w t] = my_Gabor_Win(a, t0, N, Fs)

    Ts = 1/Fs;

    t = 0:(N - 1);
    t = t * Ts;
    t = t - t0;

    k0 = 1 / (2 * (pi * a)^(1/2));
    t2 = t.^2;
    
    w = k0 * exp(-t2/(4 * a));
        
    w_sum = sum(w);                                         % Sumatoria de los valores de w
    w = w/w_sum;                                            % Normalizo para el valor 1

end