%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales en Tiempo Real
%   Profesor : Ing. Juli�n Santiago Bruno
%
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc. Ing. Franco Mart�n Pessana
%
%   function [espectro img ] = PlotFFT_pot( sgn, fs, mode, polar ) ;
%
%   Par�metros de Entrada :
%
%       sgn     : array con las muestras de la se�al
%       modo    : par�metro del plot
%       polar   : 0 -> grafica parte real e imaginaria de la se�al
%                 1 -> grafica modulo y fase de la se�al
%
%   Par�metros de salida :
% 
%       signal      : Array de N muestras con la se�al
%       timeAxis    : Array de N muestras con el eje temporal
%
%   Fecha de creaci�n   : 08-04-2010
%   �ltima Modificaci�n : 17-01-2011
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [espectro img ] = PlotFFT_pot( sgn, modo, polar )

%% Definici�n de par�metros :

margenY = 0.1 ;                     % Margen porcentual en el eje y
margenF = 0.1 ;                     % Margen porcentual en el eje de freq.

NF = 2 ;                            % N�mero de filas del gr�fico
NC = 1 ;                            % N�mero de columnas del gr�fico


%% Implementaci�n de la funci�n :

N = size(sgn ,2 ) ;

espectro = fft(sgn ) ;              % Hago la fft de la se�al
espectro = fftshift(espectro ) ;    % Corro el espectro para que tenga su centro en cero

spc_norm = ((abs (espectro)).^2 );          % Norma del espectro
spc_pot = sum ( spc_norm)/N ;               % Potencia total de la se�al
spc_dB = 10 * log10 ( spc_norm / spc_pot) ; % Potencia en dB

espectro = spc_dB ;                         % Uso el espectro en dB

if (polar == 1 )                    % Grafico polar : M�dulo y Fase
    
    modulo  = abs (espectro ) ;     % Calculo el m�dulo de las muestras
    fase    = angle (espectro ) ;   % Calculo la fase del espectro de la se�al
    
    g1 = 20*log10(modulo) ;
    g2 = fase ;
    
    titulo = 'M�dulo y Fase del Espectro de la Se�al' ;
    tit1 = 'M�dulo del espectro de la se�al' ;
    tit2 = 'Fase del espectro de la se�al' ;
    ylab1 = '|X(\omega)| [dB]' ;
    ylab2 = '\phi[X(\omega)] [rad]' ;
       
elseif (polar == 0 )                % Grafico cartesiano : parte real e imaginaria
    
    preal   = real (espectro ) ;    % Calculo la parte real del espectro
    pimag   = imag (espectro ) ;    % Calculo la parte imaginaria del espectro
    
    g1 = preal ;
    g2 = pimag ;
    
    titulo = 'Parte Real e Imaginaria del Espectro de la Se�al' ;
    tit1 = 'Parte Real del espectro de la se�al' ;
    tit2 = 'Parte Imaginaria del espectro de la se�al' ;
    
    ylab1 = 'Real [X(\omega) ]' ;
    ylab2 = 'Imag [X(\omega) ]' ;

end

% Escalo el eje de frecuencias en Hz

%{
res_esp = fs/N ;                    % Calculo la resoluci�n espectral
f = 0 : N - 1 ;                     % Armo el eje de frecuencia en muestras
f = f * res_esp ;                   % Escalo el eje de frecuencia en la resoluci�n espectral

f = f - fs / 2 ;                    % Cambio el centro del eje de frecuencias a cero
%}

n = 0 : N - 1 ;                     % Eje con n�mero de muestras
n = n - N/2 ;                       % Muevo el eje al centro

%% Correci�n de m�rgenes

[max1 min1 ] = Margenes(g1, margenY ) ;
[max2 min2 ] = Margenes(g2, margenY ) ;

% fmin = min(f) * (1 + margenF ) ;
% fmax = max(f) * (1 + margenF ) ;

%% Gr�fico de las se�ales :

img = figure () ;                   % Obtengo el handler de la imagen

% Primer Gr�fico :

subplot (NF, NC, 1) ;
plot (n, g1, modo, 'LineWidth', 2 ) ;               
grid on ;
% xlim ([fmin fmax ] ) ;
ylim ([min1 max1 ] ) ;

%xlabel ('f[Hz]' ) ;
ylabel (ylab1) ;
title(tit1 ) ;

% Segundo Gr�fico :

subplot (NF, NC, 2) ;
plot (n, g2, modo, 'LineWidth', 2) ;               
grid on ;
% xlim ([fmin fmax ] ) ;
ylim ([min2 max2 ] ) ;

%xlabel ('f[Hz]' ) ;
ylabel (ylab2) ;
title(tit2 ) ;

set(gcf, 'Name', titulo) ;

end