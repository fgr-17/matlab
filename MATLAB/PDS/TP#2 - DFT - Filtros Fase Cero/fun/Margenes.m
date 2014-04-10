%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc. Ing. Franco Mart�n Pessana
%
%   function [maximo minimo] = Margenes(signal )
%
%   Par�metros de Entrada :
%
%           sgn                 : se�al a calcular los m�rgenes
%           margen_porcentual   : porcentaje respecto a los m�ximos
%
%   Par�metros de salida :
% 
%       maximo  : valor m�ximo del m�rgen del gr�fico
%       minimo  : valor m�nimo del m�rgen del gr�fico
%
%   Fecha de creaci�n   : 13-10-2010
%   �ltima Modificaci�n : 13-10-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [maximo minimo] = Margenes(sgn, margen_porcentual )

maximo = max(sgn );         % M�ximo de la se�al a graficar
minimo = min(sgn );         % M�nimo de la se�al a graficar

span = maximo - minimo ;    % Rango din�mico de la se�al

if(span == 0)
    span = 1 ;  % Fuerzo el span si las se�ales tienen sus muestras iguales
end

margen = margen_porcentual * abs(span ) ;

maximo = maximo + margen ;
minimo = minimo - margen ;


end