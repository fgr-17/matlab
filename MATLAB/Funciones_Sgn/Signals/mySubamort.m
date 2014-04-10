%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Genera un escal�n de amplitud A desplazado en el tiempo.
%
%   function [signal timeAxis] = mySubamort( A, f0, alpha ,N , Fs)
%
%   Par�metros de Entrada :
%
%       A       : Amplitud pico de la se�al.
%       f       : frecuencia fundamental de la se�al
%       alpha   : factor de atenuaci�n
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

function [signal timeAxis] = mySubamort( A, f0, alpha ,N , Fs)

timeAxis = 0:(N-1) ;            % vector de tiempo en muestras
ts = 1/Fs ;                     % tiempo de sampleo
timeAxis = timeAxis * ts ;      % escalo al tiempo de sampleo

x_sen = mySin (A, f0, 0, N, Fs) ;    % se�al senoidal
x_exp = myExp (1, 0, -alpha, N, Fs) ; % se�al exponencial

signal = x_sen .* x_exp ;


end