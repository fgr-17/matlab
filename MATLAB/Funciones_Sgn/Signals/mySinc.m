%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Genera un escalón de amplitud A desplazado en el tiempo.
%
%   function [signal timeAxis] = mySinc( A, f0, t0 ,N , Fs)
%
%   Parámetros de Entrada :
%
%       A       : Amplitud pico de la señal.
%       f       : frecuencia fundamental de la señal
%       t0      : Instante inicial de la señal.
%       N       : Cantidad de muestras a generar.
%       Fs      : Frecuencia de muestreo.
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


function [signal timeAxis] = mySinc(A, f0, t0, N, fs)

timeAxis = 0:(N - 1) ;                                                              % vector de tiempo en muestras
ts = 1/fs ;                                                                         % tiempo de sampleo
timeAxis = timeAxis * ts ;                                                          % escalo al tiempo de sampleo
timeAxis = timeAxis  - t0;

w0 = (2*pi*f0);                                                                     % pulsación fundamental (el pi esta considerado en sinc)

signal = A * sinc(w0*(timeAxis)/pi) ;

end