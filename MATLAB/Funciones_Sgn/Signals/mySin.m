%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales en Tiempo Real
%   Profesor : Ing. Julián Santiago Bruno
%
%   function [signal timeAxis] = mySin(A, f0, ph0, N, fs)
%
%   Parámetros de Entrada :
%
%       A    = Amplitud Pico de la señal senoidal.
%       f0   = Frecuencia fundamental del tono senoidal, en Hertz.
%       ph0  = Fase de la señal en radianes.
%       N    = Cantidad de muestras tomadas para generar el array.
%       fs   = Frecuencia de sampleo
%
%   Parámetros de salida :
% 
%       signal   = Array de N muestras con la señal
%       timeAxis = Array de N muestras con el eje temporal
%
%   Fecha de creación   : 08-04-2010
%   Última Modificación : 14-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function [signal timeAxis] = mySin(A, f0, ph0, N, fs)

timeAxis = 0:(N-1) ;           % vector de tiempo en muestras
ts = 1/fs ;                    % tiempo de sampleo
timeAxis = timeAxis * ts ;     % vector de tiempo escalado en ts

w0 = 2*pi*f0 ;                  % Pulsación fundamental de la señal

signal = A*sin(2*pi*f0*timeAxis + ph0) ;  % señal

end 