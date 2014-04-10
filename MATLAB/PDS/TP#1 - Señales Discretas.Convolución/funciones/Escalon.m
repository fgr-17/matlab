%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Trabajo Práctico #1 : Señales Discretas. Convolución.
%
%   
%   function [sgn t_axis] = Escalon(fs, L)
%
%   Parámetros de Entrada:
%       fs  : Frecuencia de muestreo
%       L   : Longitud de la señal
%
%   Parámetro de Salida
%       sgn     : array de muestras de la señal Escalón unitario u[n]
%       t_axis  : Eje temporal 
%
%   Fecha de creación : 11-09-2010
%   Última Modificación : 11-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function [sgn t_axis] = Escalon(fs, L)


Ts = 1/fs;              % Período de muestreo
t0 = 0 ;                % Instante inicial de la señal
tf = (L-1)*Ts ;         % Instante de finalización de la señal

t_axis = t0:Ts:tf ;     % Eje temporal de la señal

sgn = ones(1,L) ;      % Inicialización del array de muestras de la señal

end