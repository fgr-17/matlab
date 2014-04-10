%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #2 : DFT. Filtros de Fase Cero
%
%   funcion h = pasaaltos_ideal (wc, N )
% 
%   Par�metros de Entrada :
%
%       wc  : frecuencia de corte discreta del filtro
%       N   : cantidad de coeficientes del filtro
%
%   Par�metros de salida :
% 
%       h   : respuesta al impulso del filtro
%       H   : espectro del filtro
%
%   Fecha de creaci�n   : 15-10-2010
%   �ltima Modificaci�n : 15-10-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [h H ] = pasaaltos_ideal (wc, N )

H  = ones(1, N) ;      % Inicializo el espectro con ceros
h  = ones(1, N) ;      % Inicializo la respuesta al impulso con ceros

if (wc >= pi )
    disp( 'La frecuencia de corte no cumple la condici�n de Nyquist' ) ;
    return
end

N1 = round((wc * N) /(2 * pi) ) ; % Frecuencia de corte en muestras
N2 = N - N1 + 1 ;        

H (1 : N1 )   = zeros(1, N1) ;
H (N2 : N )   = zeros(1, N1) ; 

h = ifft( H) ;      % La respuesta al impulso del filtro es la IFFT de H(w)

end