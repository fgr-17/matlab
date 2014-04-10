%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   function [signal timeAxis] = myDelta( A, t0, N, Fs ) ;
%
%   Par�metros de Entrada :
%
%       A   : Amplitud de la se�al delta
%       t0  : Desplazamiento temporal de la se�al
%       N   : Cantidad de muestras a generar.
%       fs  : Frecuencia de muestreo.
%
%   Par�metros de salida :
% 
%       signal   = Array de N muestras con la se�al
%       timeAxis = Array de N muestras con el eje temporal
%
%   Fecha de creaci�n   : 21-05-2010
%   �ltima Modificaci�n : 21-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [signal timeAxis] = myDelta( A, t0, N, fs ) 


timeAxis = 0:(N-1) ;            % vector de tiempo en muestras
ts = 1/fs ;                     % tiempo de sampleo
timeAxis = timeAxis * ts ;      % escalo al tiempo de sampleo

N_t0 = round (t0 /ts) ;         % redondeo la posici�n del impulso

signal = zeros ( 1, N) ;        % genero un array de ceros

if (N_t0 < N )
    signal (N_t0) = A ;
end

end