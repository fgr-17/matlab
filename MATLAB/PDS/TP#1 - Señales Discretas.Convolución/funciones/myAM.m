%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   function [signal timeAxis] = myAM( Am, Ac, fm, fc, N, Fs ) ;
%
%   Parámetros de Entrada :
%
%       Am  : Amplitud pico de la señal modulante.
%       Ac  : Amplitud pico de la señal portadora.
%       fm  : frecuencia de la señal modulante.
%       fc  : frecuencia de la señal portadora
%       N   : Cantidad de muestras a generar.
%       fs  : Frecuencia de muestreo.
%
%   Parámetros de salida :
% 
%       signal   = Array de N muestras con la señal
%       timeAxis = Array de N muestras con el eje temporal
%
%   Fecha de creación   : 14-05-2010
%   Última Modificación : 14-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function [signal timeAxis] = myAM( Am, Ac, fm, fc, N, fs ) 


timeAxis = 0:(N-1) ;            % vector de tiempo en muestras
ts = 1/fs ;                     % tiempo de sampleo
timeAxis = timeAxis * ts ;      % vector de tiempo escalado en ts



% Genero señal modulante :
ph0_m = 0 ;                     % fase inicial de la modulante
xm = mySin (Am/Ac, fm, ph0_m, N, fs ) ;  

% Genero la señal portadora
ph0_c = pi/4 ;                  % fase de señal portadora = 90° (coseno)
xc = mySin ( Ac, fc, ph0_c, N, fs ) ;

signal = (1 + xm) .* xc ;
% [signal timeAxis] = modulate(xm, fc, fs, 'amdsb-tc' );



end

