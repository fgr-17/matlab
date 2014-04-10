%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #1 : Se�ales Discretas. Convoluci�n.
%
%   
%   function [sgn t_axis] = D_Sierra(L, A, N, fs)
%
%   Par�metros de Entrada:
%       L   : Longitud de la se�al
%       A   : Valor Pico
%       N   : Per�odo de la secuencia
%       fs  : Frecuencia de Sampleo
%
%   Par�metro de Salida
%       sgn     : array de muestras de la se�al dientes de sierra
%       t_axis  : Eje temporal 
%
%   Fecha de creaci�n : 12-09-2010
%   �ltima Modificaci�n : 12-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [sgn t_axis] = D_Sierra (L, A, N, fs)


Ts = 1/fs;              % Per�odo de muestreo
t0 = 0 ;                % Instante inicial de la se�al
tf = (L-1)*Ts ;         % Instante de finalizaci�n de la se�al

t_axis = t0:Ts:tf ;     % Eje temporal de la se�al

T_default = 2*pi ;      % Per�odo por default de la se�al sawtooth

f0 = 1/N ;              % Frecuencia fundamental de la se�al

w0 = (2*pi*f0) ;        % Pulsaci�n fundamental de la se�al

sgn = A * sawtooth(w0*t_axis) ; % Genero la se�al

end