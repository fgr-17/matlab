%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales en Tiempo Real
%   Profesor : Ing. Julián Santiago Bruno
%
%   function [signal timeAxis] = myPulse(A ,t0 ,t1 ,N , Fs)
%
%   Parámetros de Entrada :
%
%       A   : Amplitud pico de la señal.
%       t0  : Tiempo inicial.
%       t1  : Tiempo final.
%       N   : Cantidad de muestras a generar.
%       Fs  : Frecuencia de muestreo.
%
%   Parámetros de salida :
% 
%       signal   = Array de N muestras con la señal
%       timeAxis = Array de N muestras con el eje temporal
%
%   Fecha de creación   : 01-05-2010
%   Última Modificación : 14-09-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function [signal timeAxis] = myPulse(A ,t0 ,t1 ,N , Fs)

Dt = t1 - t0 ;   % Ancho del pulso a generar

if ( Dt < 0)
    disp('t1 debe ser mayor a t0') ;
    return ;
end

T = t0 + Dt ;                   % Tiempo de información (el resto es cero)
Ts = 1/Fs ;                     % Tiempo de sampleo

timeAxis = 0:(N-1) ;            % vector de tiempo en muestras
timeAxis = timeAxis*Ts ;        % vector de tiempo escalado en ts

N0 = round(t0/Ts) ;             % cantidad de muestras de la señal en alto
N1 = round(t1/Ts) - N0 ;        % ver round y floor
Ntot = N1 + N0 ;

if ( N > N0)        % si muestreo más allá de la parte del pulso en cero
    signal(1:N0) = 0 ;          % pongo en bajo las muestras de t0
    if( N > Ntot)
        signal(N0 + 1:Ntot ) = A ;  % pongo en alto la señal hasta t0+t1
        signal(Ntot + 1:N) = 0 ;    % y pongo en cero el resto 
    else
        signal(N0 + 1:N) = A ;      % si no me pasé del tiempo en alto
    end
else
    signal(1:N) = 0 ;          % si muestreo menos de t0
end

end
