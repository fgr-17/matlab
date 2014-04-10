%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales en Tiempo Real
%   Profesor : Ing. Juli�n Santiago Bruno
%
%   function [signal timeAxis] = mySin(A, f0, ph0, N, fs)
%
%   Par�metros de Entrada :
%
%       A    = Amplitud Pico de la se�al senoidal.
%       f0   = Frecuencia fundamental del tono senoidal, en Hertz.
%       ph0  = Fase de la se�al en radianes.
%       N    = Cantidad de muestras tomadas para generar el array.
%       fs   = Frecuencia de sampleo
%
%   Par�metros de salida :
% 
%       signal   = Array de N muestras con la se�al
%       timeAxis = Array de N muestras con el eje temporal
%
%   Fecha de creaci�n   : 08-04-2010
%   �ltima Modificaci�n : 14-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [signal timeAxis] = mySin(A, f0, ph0, N, fs)

timeAxis = 0:(N-1) ;           % vector de tiempo en muestras
ts = 1/fs ;                    % tiempo de sampleo
timeAxis = timeAxis * ts ;     % vector de tiempo escalado en ts

w0 = 2*pi*f0 ;                  % Pulsaci�n fundamental de la se�al

signal = A*sin(2*pi*f0*timeAxis + ph0) ;  % se�al

end 