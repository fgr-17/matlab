%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   function [signal timeAxis] = myDelta( A, t0, N, Fs ) ;
%
%   Parámetros de Entrada :
%
%       A   : Amplitud de la señal delta
%       t0  : Desplazamiento temporal de la señal
%       N   : Cantidad de muestras a generar.
%       fs  : Frecuencia de muestreo.
%
%   Parámetros de salida :
% 
%       signal   = Array de N muestras con la señal
%       timeAxis = Array de N muestras con el eje temporal
%
%   Fecha de creación   : 21-05-2010
%   Última Modificación : 21-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function [signal timeAxis] = myDelta( A, t0, N, fs ) 


timeAxis = 0:(N-1) ;            % vector de tiempo en muestras
ts = 1/fs ;                     % tiempo de sampleo
timeAxis = timeAxis * ts ;      % escalo al tiempo de sampleo

N_t0 = round (t0 /ts) ;         % redondeo la posición del impulso

signal = zeros ( 1, N) ;        % genero un array de ceros

if (N_t0 < N )
    signal (N_t0) = A ;
end

end