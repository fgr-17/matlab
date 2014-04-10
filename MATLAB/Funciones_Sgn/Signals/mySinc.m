%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Genera un escal�n de amplitud A desplazado en el tiempo.
%
%   function [signal timeAxis] = mySinc( A, f0, t0 ,N , Fs)
%
%   Par�metros de Entrada :
%
%       A       : Amplitud pico de la se�al.
%       f       : frecuencia fundamental de la se�al
%       t0      : Instante inicial de la se�al.
%       N       : Cantidad de muestras a generar.
%       Fs      : Frecuencia de muestreo.
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


function [signal timeAxis] = mySinc(A, f0, t0, N, fs)

timeAxis = 0:(N - 1) ;                                                              % vector de tiempo en muestras
ts = 1/fs ;                                                                         % tiempo de sampleo
timeAxis = timeAxis * ts ;                                                          % escalo al tiempo de sampleo
timeAxis = timeAxis  - t0;

w0 = (2*pi*f0);                                                                     % pulsaci�n fundamental (el pi esta considerado en sinc)

signal = A * sinc(w0*(timeAxis)/pi) ;

end