%-------------------------------------------------------------------------
%
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc. Ing. Franco Martín Pessana
%
%   function [sgn_fil ] = FiltroNivel(sgn, L) ;
%
%   Parámetros de Entrada :
%
%       sgn     : señal a filtrar
%       L       : Nivel de filtrado
%
%   Parámetros de salida :
% 
%       sgn_fil     : Señal filtrada
%
%   Fecha de creación   : 02-11-2010
%   Última Modificación : 16-01-2011
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

% Filtro por nivel : hago la transformada fft de la señal y luego filtro el
% espectro de acuerdo al valor de los componentes. Tomo el máximo y luego
% elimino todas las componentes que tengan un módulo un cierto porcentaje
% menor al máximo. Sirve para eliminar ruido blanco, en el caso de que la
% señal tenga todas sus componentes con mayor amplitud que el ruido.


function [sgn_fil] = FiltroNivel ( sgn, L)

N   = size( sgn, 2) ;           % Largo de la señal
spc = fft ( sgn) ;              % Espectro de la señal

spc_norm = ((abs (spc)).^2 );               % Norma del espectro
spc_pot = sum ( spc_norm)/N ;               % Potencia total de la señal
spc_dB = 10 * log10 ( spc_norm / spc_pot) ; % Potencia en dB

for i = 1 : N                   % Recorro el espectro de la señal   
    if( spc_dB( i) <= L)        % Si el módulo del componente es menor a L        
        spc ( i) = 0 ;          % Lo elimino        
    end        
end

sgn_fil = ifft( spc) ;           % Devuelvo la antitransformada de la señal filtrada

end
