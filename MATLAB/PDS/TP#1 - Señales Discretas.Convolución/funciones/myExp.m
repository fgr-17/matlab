%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   function [signal timeAxis] = myExp(A ,t0 ,alpha ,N , Fs)
%
%   Parámetros de Entrada :
%
%       A       : Amplitud pico de la señal.
%       t0      : Instante inicial de la señal.
%       alpha   : constante de amortiguación de la señal.
%       N       : Cantidad de muestras a generar.
%       Fs      : Frecuencia de muestreo.
%
%   Parámetros de salida :
% 
%       signal   = Array de N muestras con la señal
%       timeAxis = Array de N muestras con el eje temporal
%
%   Fecha de creación   : 17-05-2010
%   Última Modificación : 17-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function [signal timeAxis] = myExp(A ,t0 ,alpha ,N , fs)

timeAxis = 0:(N-1) ;            % vector de tiempo en muestras
ts = 1/fs ;                     % tiempo de sampleo

timeAxis = timeAxis * ts ;      % vector de tiempo escalado en ts

[u_t t] = myEsc(1,t0, N, fs) ;

signal = A * exp(alpha*(timeAxis-t0)) .* u_t ;

end