%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #1 : Se�ales Discretas. Convoluci�n.
%
%   
%   function [sgn t_axis] = Escalon(fs, L)
%
%   Par�metros de Entrada:
%       fs  : Frecuencia de muestreo
%       L   : Longitud de la se�al
%
%   Par�metro de Salida
%       sgn     : array de muestras de la se�al Escal�n unitario u[n]
%       t_axis  : Eje temporal 
%
%   Fecha de creaci�n : 11-09-2010
%   �ltima Modificaci�n : 11-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [sgn t_axis] = Escalon(fs, L)


Ts = 1/fs;              % Per�odo de muestreo
t0 = 0 ;                % Instante inicial de la se�al
tf = (L-1)*Ts ;         % Instante de finalizaci�n de la se�al

t_axis = t0:Ts:tf ;     % Eje temporal de la se�al

sgn = ones(1,L) ;      % Inicializaci�n del array de muestras de la se�al

end