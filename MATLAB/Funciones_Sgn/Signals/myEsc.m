%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Genera un escalón de amplitud A desplazado en el tiempo.
%
%   function [signal timeAxis] = myEsc(A ,t0 ,N , Fs)
%
%   Parámetros de Entrada :
%
%       A       : Amplitud pico de la señal.
%       t0      : Instante inicial de la señal.
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

function [signal timeAxis] = myEsc(A ,t0 ,N , fs)

timeAxis = 0:(N-1) ;            % vector de tiempo en muestras
ts = 1/fs ;                     % tiempo de sampleo

N_t0 = round (t0 /ts) ;         % índice de comienzo del escalon

timeAxis = timeAxis * ts ;      % vector de tiempo escalado en ts

signal = (timeAxis >= t0 ) ;

signal = A*signal ;


end