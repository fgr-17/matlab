%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo: Ondita_Basica.m
%
%   function Ondita_Basica
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


function [w t] = Ondita_Basica(a, b, f0, fm, N, Fs)

    Ts = 1/Fs;                                                          % Frecuencia de muestreo

    t = 0:(N - 1);                                                      % Array de nro. de muestras
    t = t * Ts;                                                         % Escalo el array en tiempo
    t = t - b;                                                          % Inicio el array en t0
    t = t / a;                                                          % Escalo el array con el factor "a"
    
    fmod = mySin(1, f0, 0, N, Fs);                                      % Se�al modulante
    
    w0 = 2*pi*f0;                                                       % Frecuencia b�sica de la sinc
        
    k0 = w0 / (pi * Fs);                                                % Constante de amplitud
    
    w = mySinc(k0, f0, b/a, N, Fs * a);                                   % Calculo la sinc
    
    w = w .* fmod;                                                      % Multiplico por la frecuencia de modulaci�n
    
    w_sum = sum(w);                                                     % Calculo el �rea bajo la curva
    w = w/w_sum;                                                        % Y la normalizo a uno
end