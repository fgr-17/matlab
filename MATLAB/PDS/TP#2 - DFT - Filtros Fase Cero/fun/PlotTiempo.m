%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales en Tiempo Real
%   Profesor : Ing. Juli�n Santiago Bruno
% 
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc. Ing. Franco Mart�n Pessana
%
%   function handler = PlotTiempo(sgn, timeAxis, titulo, xlab, ylab, mode)
%
%   Par�metros de Entrada:
%       sgn         : Se�al a graficar
%       timeAxis    : Eje de tiempo de la se�al a graficar
%       titulo      : T�tulo de la figura
%       xlab        : Etiqueta del eje x
%       ylab        : Etiqueta del eje y
%       modo        : 0 -> plot , 1 -> stem
%
%
%   Fecha de creaci�n : 11-05-2010
%   �ltima Modificaci�n : 12-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function handler = PlotTiempo(sgn, timeAxis, titulo, xlab, ylab, modo, color)

margen_porcentual = 0.1;          % Margen porcentual en el eje y

N = size(sgn, 2) ;      % Cantidad de muestras de la se�al

Ts = timeAxis(2) - timeAxis(1) ;    % Per�odo de sampleo

fs = 1/Ts ;     % Calculo de la frecuencia de sampleo

xmin = min( timeAxis);  % Instante inicial de la se�al
xmax = max( timeAxis);  % Instante final de la se�al

% handler = figure() ;

handler = gcf ;

% Gr�fico de la se�al :
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

set(handler, 'Name', 'Gr�fico Temporal' ) ;

end