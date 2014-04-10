%-------------------------------------------------------------------------
%
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc. Ing. Franco Mart�n Pessana
%
%   function [sgn_fil ] = FiltroNivel(sgn, L) ;
%
%   Par�metros de Entrada :
%
%       sgn     : se�al a filtrar
%       L       : Nivel de filtrado
%
%   Par�metros de salida :
% 
%       sgn_fil     : Se�al filtrada
%
%   Fecha de creaci�n   : 02-11-2010
%   �ltima Modificaci�n : 16-01-2011
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

% Filtro por nivel : hago la transformada fft de la se�al y luego filtro el
% espectro de acuerdo al valor de los componentes. Tomo el m�ximo y luego
% elimino todas las componentes que tengan un m�dulo un cierto porcentaje
% menor al m�ximo. Sirve para eliminar ruido blanco, en el caso de que la
% se�al tenga todas sus componentes con mayor amplitud que el ruido.


function [sgn_fil] = FiltroNivel ( sgn, L)

N   = size( sgn, 2) ;           % Largo de la se�al
spc = fft ( sgn) ;              % Espectro de la se�al

spc_norm = ((abs (spc)).^2 );               % Norma del espectro
spc_pot = sum ( spc_norm)/N ;               % Potencia total de la se�al
spc_dB = 10 * log10 ( spc_norm / spc_pot) ; % Potencia en dB

for i = 1 : N                   % Recorro el espectro de la se�al   
    if( spc_dB( i) <= L)        % Si el m�dulo del componente es menor a L        
        spc ( i) = 0 ;          % Lo elimino        
    end        
end

sgn_fil = ifft( spc) ;           % Devuelvo la antitransformada de la se�al filtrada

end
