%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales en Tiempo Real
%   Profesor : Ing. Juli�n Santiago Bruno
%
%   function PlotTiempo(sgn, timeAxis, titulo, xlab, ylab, mode, color)
%
%   Par�metros de Entrada:
%       sgn         : Se�al a graficar
%       timeAxis    : Eje de tiempo de la se�al a graficar
%       titulo      : T�tulo de la figura
%       xlab        : Etiqueta del eje x
%       ylab        : Etiqueta del eje y
%       mode        : 0 -> plot , 1 -> stem
%       color       : Par�metro para el plot.
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

function PlotTiempo(sgn, timeAxis, titulo, xlab, ylab, mode, color)

% margen=0.01;                                                              % Margen porcentual en el eje y

N = size(sgn, 2) ;                                                          % Cantidad de muestras de la se�al

Ts = timeAxis(2) - timeAxis(1) ;                                            % Período de sampleo

fs = 1/Ts ;                                                                 % Calculo de la frecuencia de sampleo

xmin = min( timeAxis);  % Instante inicial de la se�al
xmax = max( timeAxis);  % Instante final de la se�al

% Gr�fico de la se�al :
if (nargin == 7)
    if(mode == 0)
        plot( timeAxis,sgn, color, 'LineWidth', 2);
    elseif(mode == 1)
        stem( timeAxis, sgn, color) ;
    end
else
    plot( timeAxis, sgn, color, 'LineWidth', 2) ;    % por default hace plot
end

xlabel( xlab) ;     % Asigno las etiquetas de cada eje
ylabel( ylab) ;

titulo = sprintf('%s N = %d fs = %.2f', titulo, N, fs) ;

title( titulo) ;

maximo = max(sgn);          % M�ximo de la se�al a graficar
minimo = min(sgn);          % M�nimo de la se�al a graficar

span = maximo - minimo ;    % Rango din�mico de la se�al

if(span == 0)
    span = 1 ;  % Fuerzo el span si las se�ales tienen sus muestras iguales
end

margen_porcentual = 0.1 ;
margen = margen_porcentual * abs(span) ;

maximo = maximo + margen ;
minimo = minimo - margen ;

ylim([minimo maximo]);
xlim([xmin xmax]);
grid on;

end