%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Genera un escal�n de amplitud A desplazado en el tiempo.
%
%   function [signal timeAxis] = myEsc(A ,t0 ,N , Fs)
%
%   Par�metros de Entrada :
%
%       A       : Amplitud pico de la se�al.
%       t0      : Instante inicial de la se�al.
%       N       : Cantidad de muestras a generar.
%       Fs      : Frecuencia de muestreo.
%
%   Par�metros de salida :
% 
%       signal   = Array de N muestras con la se�al
%       timeAxis = Array de N muestras con el eje temporal
%
%   Fecha de creaci�n   : 17-05-2010
%   �ltima Modificaci�n : 17-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [signal timeAxis] = myEsc(A ,t0 ,N , fs)

timeAxis = 0:(N-1) ;            % vector de tiempo en muestras
ts = 1/fs ;                     % tiempo de sampleo

N_t0 = round (t0 /ts) ;         % �ndice de comienzo del escalon

timeAxis = timeAxis * ts ;      % vector de tiempo escalado en ts

signal = (timeAxis >= t0 ) ;

signal = A*signal ;


end