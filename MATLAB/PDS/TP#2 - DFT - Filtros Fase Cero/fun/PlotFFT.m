%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales en Tiempo Real
%   Profesor : Ing. Julián Santiago Bruno
%
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc. Ing. Franco Martín Pessana
%
%   function [espectro img ] = PlotFFT( sgn, fs, mode, polar ) ;
%
%   Parámetros de Entrada :
%
%       sgn     : array con las muestras de la señal
%       fs      : Frecuencia a la que fue sampleada la señal
%       modo    : parámetro del plot
%       polar   : 0 -> grafica parte real e imaginaria de la señal
%                 1 -> grafica modulo y fase de la señal
%                 2 -> Grafica solo módulo sin crear nueva figura
%
%   Parámetros de salida :
% 
%       signal      : Array de N muestras con la señal
%       timeAxis    : Array de N muestras con el eje temporal
%
%   Fecha de creación   : 08-04-2010
%   Última Modificación : 13-10-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function [espectro img ] = PlotFFT(sgn, fs, modo, polar)

%% Definición de parámetros :

margenY = 0.1 ;                     % Margen porcentual en el eje y

NF = 2 ;                            % Número de filas del gráfico
NC = 1 ;                            % Número de columnas del gráfico

%% Implementación de la función :

N = size(sgn ,2 ) ;

espectro = fft(sgn ) ;              % Hago la fft de la señal
espectro = fftshift(espectro ) ;    % Corro el espectro para que tenga su centro en cero

if(polar == 1 || polar == 2)                      % Grafico polar : Módulo y Fase
    
    modulo  = abs(espectro);        % Calculo el módulo de las muestras
    fase    = angle(espectro);      % Calculo la fase del espectro de la señal
    
    g1 = modulo ;
    g2 = fase ;
    
    titulo = 'Módulo y Fase del Espectro de la Señal' ;
    tit1 = 'Módulo del espectro de la señal' ;
    tit2 = 'Fase del espectro de la señal' ;
    ylab1 = '|X(\omega)| [dB]' ;
    ylab2 = '\phi[X(\omega)] [rad]' ;
       
elseif (polar == 0 )                % Grafico cartesiano : parte real e imaginaria
    
    preal   = real (espectro ) ;    % Calculo la parte real del espectro
    pimag   = imag (espectro ) ;    % Calculo la parte imaginaria del espectro
    
    g1 = preal ;
    g2 = pimag ;
    
    titulo = 'Parte Real e Imaginaria del Espectro de la Señal' ;
    tit1 = 'Parte Real del espectro de la señal' ;
    tit2 = 'Parte Imaginaria del espectro de la señal' ;
    
    ylab1 = 'Real [X(\omega) ]' ;
    ylab2 = 'Imag [X(\omega) ]' ;

end

% Escalo el eje de frecuencias en Hz

n = 0 : N - 1 ;                     % Eje con número de muestras
n = n - N/2 ;                       % Muevo el eje al centro

%% Correción de márgenes

[max1 min1 ] = Margenes(g1, margenY ) ;
[max2 min2 ] = Margenes(g2, margenY ) ;


%% Gráfico de las señales :

if(polar == 0 || polar == 1)
    img = figure () ;                   % Obtengo el handler de la imagen       

    % Primer Gráfico :

    subplot (NF, NC, 1) ;
    plot (n, g1, modo, 'LineWidth', 2 ) ;               
    grid on ;
    % xlim ([fmin fmax ] ) ;
    ylim ([min1 max1 ] ) ;

    %xlabel ('f[Hz]' ) ;
    ylabel (ylab1) ;
    title(tit1 ) ;

    % Segundo Gráfico :

    subplot (NF, NC, 2) ;
    plot (n, g2, modo, 'LineWidth', 2 ) ;               
    grid on ;
    % xlim ([fmin fmax ] ) ;
    ylim ([min2 max2 ] ) ;

    %xlabel ('f[Hz]' ) ;
    ylabel (ylab2) ;
    title(tit2 ) ;

    set(gcf, 'Name', titulo) ;
elseif(polar == 2)
    
    img = gcf();
    
    plot (n, g1, modo, 'LineWidth', 2 ) ;               
    grid on ;
    % xlim ([fmin fmax ] ) ;
    ylim ([min1 max1 ] ) ;

    %xlabel ('f[Hz]' ) ;
    ylabel (ylab1) ;
    title(tit1 ) ;    
    
end

end