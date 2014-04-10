%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo: my_Wavelet.m
%
%   function my_Wavelet
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


function [w t] = my_Wavelet(fc, f0, t0, N, Fs)

    Ts = 1/Fs;                                                          % Frecuencia de muestreo

    t = 0:(N - 1);                                                      % Array de nro. de muestras
    t = t * Ts;                                                         % Escalo el array en tiempo
    t = t - t0;                                                         % Inicio el array en t0
    % t = t / a;
    
    fmod = mySin(1, f0, 0, N, Fs);                                      % Señal modulante
    
    wc = 2*pi*fc;   
        
    kc = wc / (pi * Fs);    
    
    w = mySinc(kc, fc, t0, N, Fs);
    w = w .* fmod;   
    w_sum = sum(w);
    w = w/w_sum;
end