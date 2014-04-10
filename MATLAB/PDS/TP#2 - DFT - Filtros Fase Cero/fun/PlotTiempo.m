%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales en Tiempo Real
%   Profesor : Ing. Julián Santiago Bruno
% 
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc. Ing. Franco Martín Pessana
%
%   function handler = PlotTiempo(sgn, timeAxis, titulo, xlab, ylab, mode)
%
%   Parámetros de Entrada:
%       sgn         : Señal a graficar
%       timeAxis    : Eje de tiempo de la señal a graficar
%       titulo      : Título de la figura
%       xlab        : Etiqueta del eje x
%       ylab        : Etiqueta del eje y
%       modo        : 0 -> plot , 1 -> stem
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

function handler = PlotTiempo(sgn, timeAxis, titulo, xlab, ylab, modo, color)

margen_porcentual = 0.1;          % Margen porcentual en el eje y

N = size(sgn, 2) ;      % Cantidad de muestras de la señal

Ts = timeAxis(2) - timeAxis(1) ;    % Período de sampleo

fs = 1/Ts ;     % Calculo de la frecuencia de sampleo

xmin = min( timeAxis);  % Instante inicial de la señal
xmax = max( timeAxis);  % Instante final de la señal

% handler = figure() ;

handler = gcf ;

% Gráfico de la señal :
if(modo == 0)
    plot( timeAxis, sgn, color, 'LineWidth', 2)  ;
elseif(modo == 1)
    stem( timeAxis, sgn, color) ;
end


xlabel( xlab) ;     % Asigno las etiquetas de cada eje
ylabel( ylab) ;

titulo = sprintf('%s N = %d fs = %d', titulo, N, fs) ;

title( titulo) ;

[maximo minimo ] = Margenes(sgn, margen_porcentual) ;

ylim([minimo maximo]);
xlim([xmin xmax]);
grid on;

set(handler, 'Name', 'Gráfico Temporal' ) ;

end