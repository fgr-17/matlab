% -------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Trabajo Práctico #1 : Señales Discretas. Convolución.
%
%   
%   function [sgn t_axis] = Cuadrada(L, A, N, duty, fs)
%
%   Parámetros de Entrada:
%       L   : Longitud de la señal
%       A   : Valor Pico
%       N   : Período de la secuencia
%       duty: ciclo de trabajo
%       fs  : Frecuencia de Sampleo
%
%   Parámetro de Salida
%       sgn     : array de muestras de la señal cuadrada
%       t_axis  : Eje temporal 
%
%   Fecha de creación   : 12-09-2010
%   Última Modificación : 12-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
% -------------------------------------------------------------------------

function [sgn t_axis] = Cuadrada(L, A, N, duty, fs)

Ts = 1 / fs;                                                            % Período de muestreo
t0 = 0 ;                                                                % Instante inicial de la señal
tf = (L - 1) * Ts;                                                      % Instante de finalización de la señal

t_axis = t0:Ts:tf ;                                                     % Eje temporal de la señal

f0 = 1/(N * Ts);                                                        % Frecuencia fundamental de la señal

w0 = (2*pi*f0);                                                         % Pulsación fundamental de la señal

sgn = A * square(w0 * t_axis, duty);                                    % Genero la señal

end