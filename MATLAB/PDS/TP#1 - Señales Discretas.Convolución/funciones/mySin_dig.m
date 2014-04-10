%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales en Tiempo Real
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   function [signal timeAxis] = mySin_dig(A, delay_N ,Pe, N )
%
%   Parámetros de Entrada :
%
%       A       : Amplitud Pico de la señal senoidal.
%       delay_N : Retardo en cantidad de muestras
%       Pe      : Cantidad de períodos de la señal a muestrear. 
%       N       : Cantidad de muestras tomadas para generar el array.
%
%   Parámetros de salida :
% 
%       signal   = Array de N muestras con la señal
%       timeAxis = Array de N muestras con el eje temporal
%
%   Fecha de creación   : 22-09-2010
%   Última Modificación : 22-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function [signal timeAxis] = mySin_dig(A, delay_N ,Pe, N )

N = 0:N ;               % Eje cantidad de muestras
W0 = 2*pi*Pe / N ;      % Frecuencia discreta 


signal = A*sin(2*pi*f0*timeAxis + ph0) ;  % señal

end 