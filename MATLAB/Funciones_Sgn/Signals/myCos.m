%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #1 : Se�ales Discretas. Convoluci�n.
%
%   
%   function sgn = myCos(L, A, w0, ph0)
%
%   Par�metros de Entrada:
%       L   : Longitud de la se�al
%       A   : Valor Pico
%       w0  : Pulsaci�n de la se�al, 0 <= w0 <= pi
%       ph0 : Desfasaje 
%
%   Par�metro de Salida
%       sgn     : array de muestras de la se�al dientes de sierra
%       t_axis  : Eje temporal 
%
%   Fecha de creaci�n : 12-09-2010
%   �ltima Modificaci�n : 12-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function sgn = myCos(L, A, w0, ph0)


%% Validaci�n de los par�metros de entrada : 

if ((w0 < 0) || (w0 > pi))
    sgn = 0 ;
    disp('La frecuencia de la se�al debe estar entre 0 y Pi') ;
    return ;
end

if (ph0 < 0)||(ph0 > 2*pi)
    sgn = 0 ;
    disp('La fase de la se�al debe estar entre cero y 2 Pi') ;
    return ;
end

%% Algoritmo de la funci�n :

fs = 1 ;        % Frecuencia de sampleo gen�rica de 1 Hz.
Ts = 1/fs ;     % Per�odo de sampleo gen�rico de 1 s.

t0 = 0 ;        % Instante inicial de la funci�n
tf = t0 + Ts*(L-1) ; % Instante final de la funci�n

t = t0:Ts:tf ;  % Eje temporal con frecuencia de sampleo 2 Pi

sgn = A * cos (w0*t + ph0 );

stem (sgn) ;     % Gr�fico de la se�al

end