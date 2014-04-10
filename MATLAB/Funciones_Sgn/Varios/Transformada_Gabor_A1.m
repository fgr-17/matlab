%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo: Transformada_Gabor_A1.m
%
%   function Transformada_Gabor_A1
%
%   Parámetros:     x  :    Señal temporal a analizar
%                   a  :    Compresión de la ventana de Gabor
%                   t0 :    desplazamiento temporal
%                   f0 :    Frecuencia de Modulación de la ventana
%                   Fs :    Frecuencia de muestreo de la señal
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

function [y t] = Transformada_Gabor_A1(x, a, t0, f0, Fs)

L = size(x, 2);                                                     % Largo de la señal a analizar
      
if (f0 == 0)
    fmod = ones(1, L);
elseif (f0 > 0)
    fmod = mySin(1, f0, 0, L, Fs);                                  % Señal modulante
end

[W t]= my_Gabor_Win(a, t0, L, Fs);                                  % Calculo los puntos de la ventana de Gabor
Wmod = W .* fmod;                                                   % Ventana modulada
% y = Wmod .* x;                                                    % Guardo la señal filtrada    
y = filter(Wmod, 1, x);                                             % Guardo la señal filtrada    

end