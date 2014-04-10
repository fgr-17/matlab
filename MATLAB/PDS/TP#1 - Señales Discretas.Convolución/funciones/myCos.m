%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Trabajo Práctico #1 : Señales Discretas. Convolución.
%
%   
%   function sgn = myCos(L, A, w0, ph0)
%
%   Parámetros de Entrada:
%       L   : Longitud de la señal
%       A   : Valor Pico
%       w0  : Pulsación de la señal, 0 <= w0 <= pi
%       ph0 : Desfasaje 
%
%   Parámetro de Salida
%       sgn     : array de muestras de la señal dientes de sierra
%       t_axis  : Eje temporal 
%
%   Fecha de creación : 12-09-2010
%   Última Modificación : 12-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function sgn = myCos(L, A, w0, ph0)


%% Validación de los parámetros de entrada : 

if ((w0 < 0) || (w0 > pi))
    sgn = 0 ;
    disp('La frecuencia de la señal debe estar entre 0 y Pi') ;
    return ;
end

if (ph0 < 0)||(ph0 > 2*pi)
    sgn = 0 ;
    disp('La fase de la señal debe estar entre cero y 2 Pi') ;
    return ;
end

%% Algoritmo de la función :

fs = 1 ;        % Frecuencia de sampleo genérica de 1 Hz.
Ts = 1/fs ;     % Período de sampleo genérico de 1 s.

t0 = 0 ;        % Instante inicial de la función
tf = t0 + Ts*(L-1) ; % Instante final de la función

t = t0:Ts:tf ;  % Eje temporal con frecuencia de sampleo 2 Pi

sgn = A * cos (w0*t + ph0 );

stem (sgn) ;     % Gráfico de la señal

end