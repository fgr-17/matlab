%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales en Tiempo Real
%   Profesor : Ing. Julián Santiago Bruno
%
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc. Ing. Franco Martín Pessana
%
%   function [espectro img ] = PlotFFT2(sgn, fs, mode, polar);
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
%   Última Modificación : 27-05-2012
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function [espectro img ] = PlotFFT2(sgn, fs, modo, polar, NF, NC, Ngraf)

%% Definición de parámetros :

margenY = 0.1 ;                                                 % Margen porcentual en el eje y

if(nargin < 5)
	NF = 2 ;                                                    % Número de filas del gráfico
    NC = 1 ;                                                    % Número de columnas del gráfico
end

%% Implementación de la función :

N = size(sgn ,2 ) ;

espectro = fft(sgn);                                            % Hago la fft de la señal
% espectro = fftshift(espectro ) ;                              % Corro el espectro para que tenga su centro en cero

if(polar == 1 || polar == 2)                                    % Grafico polar : Módulo y Fase
    
    modulo  = abs(espectro);                                    % Calculo el módulo de las muestras
    fase    = angle(espectro);                                  % Calculo la fase del espectro de la señal
    
    max_mod = max(modulo);
    modulo_norm = modulo/max_mod;
    modulo_db = 10*log(modulo_norm);
    
    g1 = modulo_db ;
    g2 = fase ;
    
    titulo = 'Módulo y Fase del Espectro de la Señal' ;
    tit1 = 'Módulo del espectro de la señal' ;
    tit2 = 'Fase del espectro de la señal' ;
    ylab1 = '|X(\omega)| [dB]' ;
    ylab2 = '\phi[X(\omega)] [rad]' ;
       
elseif (polar == 0 )                                            % Grafico cartesiano : parte real e imaginaria
    
    preal   = real (espectro ) ;                                % Calculo la parte real del espectro
    pimag   = imag (espectro ) ;                                % Calculo la parte imaginaria del espectro
    
    g1 = preal ;
    g2 = pimag ;
    
    titulo = 'Parte Real e Imaginaria del Espectro de la Señal' ;
    tit1 = 'Parte Real del espectro de la señal' ;
    tit2 = 'Parte Imaginaria del espectro de la señal' ;
    
    ylab1 = 'Real [X(\omega) ]' ;
    ylab2 = 'Imag [X(\omega) ]' ;

end

% Escalo el eje de frecuencias en Hz

n = 0 : N - 1 ;                                                 % Eje con número de muestras
n = n * (fs / N);
% n = n - N/2 ;                                                   % Muevo el eje al centro

%% Correción de márgenes

[max1 min1 ] = Margenes(g1, margenY ) ;
[max2 min2 ] = Margenes(g2, margenY ) ;


%% Gráfico de las señales :

if(polar == 0 || polar == 1)
    if(nargin < 5)
        img = figure () ;                                                       % Obtengo el handler de la imagen       
    end
    % Primer Gráfico :

    subplot (NF, NC, Ngraf) ;
    plot (n, g1, modo, 'LineWidth', 2 ) ;               
    grid on ;
    % xlim ([fmin fmax ] ) ;
    ylim ([min1 max1 ] ) ;

    xlabel ('f[Hz]' ) ;
    ylabel (ylab1) ;
    title(tit1 ) ;

    % Segundo Gráfico :

    subplot (NF, NC, Ngraf + 1) ;
    plot (n, g2, modo, 'LineWidth', 2 ) ;               
    grid on ;
    % xlim ([fmin fmax ] ) ;
    ylim ([min2 max2 ] ) ;

    xlabel ('f[Hz]' ) ;
    ylabel (ylab2) ;
    title(tit2 ) ;

    set(gcf, 'Name', titulo) ;
elseif(polar == 2)
    
    img = gcf();
    
    plot (n, g1, modo, 'LineWidth', 2 ) ;               
    grid on ;
    % xlim ([fmin fmax ] ) ;
    ylim ([min1 max1 ] ) ;

    xlabel ('f[Hz]' ) ;
    ylabel (ylab1) ;
    title(tit1 ) ;    
    
end

end

%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc. Ing. Franco Martín Pessana
%
%   function [maximo minimo] = Margenes(signal )
%
%   Parámetros de Entrada :
%
%           sgn                 : señal a calcular los márgenes
%           margen_porcentual   : porcentaje respecto a los máximos
%
%   Parámetros de salida :
% 
%       maximo  : valor máximo del márgen del gráfico
%       minimo  : valor mínimo del márgen del gráfico
%
%   Fecha de creación   : 13-10-2010
%   Última Modificación : 13-10-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

function [maximo minimo] = Margenes(sgn, margen_porcentual )

maximo = max(sgn );         % Máximo de la señal a graficar
minimo = min(sgn );         % Mínimo de la señal a graficar

span = maximo - minimo ;    % Rango dinámico de la señal

if(span == 0)
    span = 1 ;  % Fuerzo el span si las señales tienen sus muestras iguales
end

margen = margen_porcentual * abs(span ) ;

maximo = maximo + margen ;
minimo = minimo - margen ;

end