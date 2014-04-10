%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Trabajo Práctico #2 : DFT. Filtros de Fase Cero
%
%   funcion h = pasaaltos_ideal (wc, N )
% 
%   Parámetros de Entrada :
%
%       wc  : frecuencia de corte discreta del filtro
%       N   : cantidad de coeficientes del filtro
%
%   Parámetros de salida :
% 
%       h   : respuesta al impulso del filtro
%       H   : espectro del filtro
%
%   Fecha de creación   : 15-10-2010
%   Última Modificación : 15-10-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function [h H ] = pasaaltos_ideal (wc, N )

H  = ones(1, N) ;      % Inicializo el espectro con ceros
h  = ones(1, N) ;      % Inicializo la respuesta al impulso con ceros

if (wc >= pi )
    disp( 'La frecuencia de corte no cumple la condición de Nyquist' ) ;
    return
end

N1 = round((wc * N) /(2 * pi) ) ; % Frecuencia de corte en muestras
N2 = N - N1 + 1 ;        

H (1 : N1 )   = zeros(1, N1) ;
H (N2 : N )   = zeros(1, N1) ; 

h = ifft( H) ;      % La respuesta al impulso del filtro es la IFFT de H(w)

end