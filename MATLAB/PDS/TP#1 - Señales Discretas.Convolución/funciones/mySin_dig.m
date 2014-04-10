%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales en Tiempo Real
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   function [signal timeAxis] = mySin_dig(A, delay_N ,Pe, N )
%
%   Par�metros de Entrada :
%
%       A       : Amplitud Pico de la se�al senoidal.
%       delay_N : Retardo en cantidad de muestras
%       Pe      : Cantidad de per�odos de la se�al a muestrear. 
%       N       : Cantidad de muestras tomadas para generar el array.
%
%   Par�metros de salida :
% 
%       signal   = Array de N muestras con la se�al
%       timeAxis = Array de N muestras con el eje temporal
%
%   Fecha de creaci�n   : 22-09-2010
%   �ltima Modificaci�n : 22-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [signal timeAxis] = mySin_dig(A, delay_N ,Pe, N )

N = 0:N ;               % Eje cantidad de muestras
W0 = 2*pi*Pe / N ;      % Frecuencia discreta 


signal = A*sin(2*pi*f0*timeAxis + ph0) ;  % se�al

end 