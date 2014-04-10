%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo: Transformada_Gabor_A1.m
%
%   function Transformada_Gabor_A1
%
%   Par�metros:     x  :    Se�al temporal a analizar
%                   a  :    Compresi�n de la ventana de Gabor
%                   t0 :    desplazamiento temporal
%                   f0 :    Frecuencia de Modulaci�n de la ventana
%                   Fs :    Frecuencia de muestreo de la se�al
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

function [y t] = Transformada_Gabor_A1(x, a, t0, f0, Fs)

L = size(x, 2);                                                     % Largo de la se�al a analizar
      
if (f0 == 0)
    fmod = ones(1, L);
elseif (f0 > 0)
    fmod = mySin(1, f0, 0, L, Fs);                                  % Se�al modulante
end

[W t]= my_Gabor_Win(a, t0, L, Fs);                                  % Calculo los puntos de la ventana de Gabor
Wmod = W .* fmod;                                                   % Ventana modulada
% y = Wmod .* x;                                                    % Guardo la se�al filtrada    
y = filter(Wmod, 1, x);                                             % Guardo la se�al filtrada    

end