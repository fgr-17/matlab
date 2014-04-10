%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #2 : DFT. Filtros de Fase Cero
%
%   funcion h = pasabanda_ideal (wc1, wc2, N )
% 
%   Par�metros de Entrada :
%
%       wc1 : comienzo de la banda de paso del filtro
%       wc2 : final de la banda de paso del filtro
%       N   : cantidad de coeficientes del filtro
%
%   Par�metros de salida :
% 
%       h   : respuesta al impulso del filtro
%       H   : espectro del filtro
%
%   Fecha de creaci�n   : 15-10-2010
%   �ltima Modificaci�n : 16-10-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [h H] = pasabanda_ideal (wc1, wc2, N )

H  = zeros(1, N) ;      % Inicializo el espectro con ceros
h  = zeros(1, N) ;      % Inicializo la respuesta al impulso con ceros

if ((wc1 >= pi ) || (wc2 >= pi) )
    disp( 'wc1 y/o wc2 no cumplen la condici�n de Nyquist' ) ;
    return
end

N1 = round((wc1 * N) /(2 * pi) ) ; % wc1 en muestras
N2 = round((wc2 * N) /(2 * pi) ) ; % wc2 en muestras

% Espectro sim�trico respecto de N/2

N3 = N - N2 + 1 ;                  
N4 = N - N1 + 1 ;        

N_bandapaso = N2 - N1 + 1;

H( N1 : N2) = ones(1, N_bandapaso) ;
H( N3 : N4) = ones(1, N_bandapaso) ;

% Obtengo la respuesta al impulso antitransformando la forma del filtro
h = ifft(H ) ;  

end