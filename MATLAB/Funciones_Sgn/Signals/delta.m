%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : Msc.Ing. F.M. Pessana
%
%   Trabajo Pr�ctico #1 : Se�ales Discretas. Convoluci�n.
%
%   
%   function [sgn t_axis] = Kron_impulse(fs, L)
%
%   Par�metros de Entrada:
%       fs  : Frecuencia de muestreo
%       L   : Longitud de la se�al
%
%   Par�metro de Salida
%       sgn     : array de muestras de la se�al Impulso disctero de 
%                 Kronecker
%       t_axis  : Eje temporal 
%
%   Fecha de creaci�n : 07-09-2010
%   �ltima Modificaci�n : 07-09-2010
%
%   Autor : Federico Roux
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [sgn t_axis] = Kronecker_Imp(fs, L)

Ts = 1/fs;              % Per�odo de muestreo
t0 = 0 ;                % Instante inicial de la se�al
tf = L*Ts ;             % Instante de finalizaci�n de la se�al

t_axis = t0:Ts:tf ;     % Eje temporal de la se�al

sgn = zeros(1,L) ;      % Inicializaci�n del array de muestras de la se�al

sgn(1) = 1 ;

end 