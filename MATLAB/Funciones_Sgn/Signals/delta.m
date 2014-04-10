%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : Msc.Ing. F.M. Pessana
%
%   Trabajo Práctico #1 : Señales Discretas. Convolución.
%
%   
%   function [sgn t_axis] = Kron_impulse(fs, L)
%
%   Parámetros de Entrada:
%       fs  : Frecuencia de muestreo
%       L   : Longitud de la señal
%
%   Parámetro de Salida
%       sgn     : array de muestras de la señal Impulso disctero de 
%                 Kronecker
%       t_axis  : Eje temporal 
%
%   Fecha de creación : 07-09-2010
%   Última Modificación : 07-09-2010
%
%   Autor : Federico Roux
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function [sgn t_axis] = Kronecker_Imp(fs, L)

Ts = 1/fs;              % Período de muestreo
t0 = 0 ;                % Instante inicial de la señal
tf = L*Ts ;             % Instante de finalización de la señal

t_axis = t0:Ts:tf ;     % Eje temporal de la señal

sgn = zeros(1,L) ;      % Inicialización del array de muestras de la señal

sgn(1) = 1 ;

end 