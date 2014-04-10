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

function [signal n_axis] = mySin_dig(A, delay_N ,Pe, N )

n_axis  = 0:N-1 ;               % Eje cantidad de muestras

W0 = 2*pi*Pe / N ;      % Frecuencia discreta 


signal = A*sin(W0*(n_axis + delay_N)) ;  % señal

end 