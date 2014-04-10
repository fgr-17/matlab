%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales en Tiempo Real
%   Profesor : Ing. Julián Santiago Bruno
%
%   function PlotTiempo(sgn, timeAxis, titulo, xlab, ylab, mode)
%
%   Parámetros de Entrada:
%       sgn         : Señal a graficar
%       timeAxis    : Eje de tiempo de la señal a graficar
%       titulo      : Título de la figura
%       xlab        : Etiqueta del eje x
%       ylab        : Etiqueta del eje y
%       mode        : 0 -> plot , 1 -> stem
%
%
%   Fecha de creación : 11-05-2010
%   Última Modificación : 12-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function PlotTiempo(sgn, timeAxis, titulo, xlab, ylab, mode, color)

% margen=0.01;          % Margen porcentual en el eje y

N = size(sgn, 2) ;      % Cantidad de muestras de la señal

Ts = timeAxis(2) - timeAxis(1) ;    % Período de sampleo

fs = 1/Ts ;     % Calculo de la frecuencia de sampleo

xmin = min( timeAxis);  % Instante inicial de la señal
xmax = max( timeAxis);  % Instante final de la señal

% Gráfico de la señal :
if (nargin == 7)
    if(mode == 0)
        plot( timeAxis,sgn, color)  ;
    elseif(mode == 1)
        stem( timeAxis, sgn, color) ;
    end
else
    plot( timeAxis, sgn, color) ;    % por default hace plot
end

xlabel( xlab) ;     % Asigno las etiquetas de cada eje
ylabel( ylab) ;

titulo = sprintf('%s N = %d fs = %d', titulo, N, fs) ;

title( titulo) ;

maximo = max(sgn);          % Máximo de la señal a graficar
minimo = min(sgn);          % Mínimo de la señal a graficar

span = maximo - minimo ;    % Rango dinámico de la señal

if(span == 0)
    span = 1 ;  % Fuerzo el span si las señales tienen sus muestras iguales
end

margen_porcentual = 0.1 ;
margen = margen_porcentual * abs(span) ;

maximo = maximo + margen ;
minimo = minimo - margen ;

ylim([minimo maximo]);
xlim([xmin xmax]);
grid on;

end