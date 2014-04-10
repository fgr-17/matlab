%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc. Ing. Franco Martín Pessana
%
%   function [maximo minimo] = Margenes(signal )
%
%   Parámetros de Entrada :
%
%           sgn                 : señal a calcular los márgenes
%           margen_porcentual   : porcentaje respecto a los máximos
%
%   Parámetros de salida :
% 
%       maximo  : valor máximo del márgen del gráfico
%       minimo  : valor mínimo del márgen del gráfico
%
%   Fecha de creación   : 13-10-2010
%   Última Modificación : 13-10-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function [maximo minimo] = Margenes(sgn, margen_porcentual )

maximo = max(sgn );         % Máximo de la señal a graficar
minimo = min(sgn );         % Mínimo de la señal a graficar

span = maximo - minimo ;    % Rango dinámico de la señal

if(span == 0)
    span = 1 ;  % Fuerzo el span si las señales tienen sus muestras iguales
end

margen = margen_porcentual * abs(span ) ;

maximo = maximo + margen ;
minimo = minimo - margen ;


end