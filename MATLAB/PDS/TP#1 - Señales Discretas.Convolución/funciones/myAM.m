%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   function [signal timeAxis] = myAM( Am, Ac, fm, fc, N, Fs ) ;
%
%   Par�metros de Entrada :
%
%       Am  : Amplitud pico de la se�al modulante.
%       Ac  : Amplitud pico de la se�al portadora.
%       fm  : frecuencia de la se�al modulante.
%       fc  : frecuencia de la se�al portadora
%       N   : Cantidad de muestras a generar.
%       fs  : Frecuencia de muestreo.
%
%   Par�metros de salida :
% 
%       signal   = Array de N muestras con la se�al
%       timeAxis = Array de N muestras con el eje temporal
%
%   Fecha de creaci�n   : 14-05-2010
%   �ltima Modificaci�n : 14-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [signal timeAxis] = myAM( Am, Ac, fm, fc, N, fs ) 


timeAxis = 0:(N-1) ;            % vector de tiempo en muestras
ts = 1/fs ;                     % tiempo de sampleo
timeAxis = timeAxis * ts ;      % vector de tiempo escalado en ts



% Genero se�al modulante :
ph0_m = 0 ;                     % fase inicial de la modulante
xm = mySin (Am/Ac, fm, ph0_m, N, fs ) ;  

% Genero la se�al portadora
ph0_c = pi/4 ;                  % fase de se�al portadora = 90� (coseno)
xc = mySin ( Ac, fc, ph0_c, N, fs ) ;

signal = (1 + xm) .* xc ;
% [signal timeAxis] = modulate(xm, fc, fs, 'amdsb-tc' );



end

