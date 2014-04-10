%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Genera un escalón de amplitud A desplazado en el tiempo.
%
%   function [signal timeAxis] = mySubamort( A, f0, alpha ,N , Fs)
%
%   Parámetros de Entrada :
%
%       A       : Amplitud pico de la señal.
%       f       : frecuencia fundamental de la señal
%       alpha   : factor de atenuación
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

function [signal timeAxis] = mySubamort( A, f0, alpha ,N , Fs)

timeAxis = 0:(N-1) ;            % vector de tiempo en muestras
ts = 1/Fs ;                     % tiempo de sampleo
timeAxis = timeAxis * ts ;      % escalo al tiempo de sampleo

x_sen = mySin (A, f0, 0, N, Fs) ;    % señal senoidal
x_exp = myExp (1, 0, -alpha, N, Fs) ; % señal exponencial

signal = x_sen .* x_exp ;


end