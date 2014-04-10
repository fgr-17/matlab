%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales en Tiempo Real
%   Profesor : Ing. Juli�n Santiago Bruno
%
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc. Ing. Franco Mart�n Pessana
%
%   function [espectro img ] = PlotFFT2(sgn, fs, mode, polar);
%
%   Par�metros de Entrada :
%
%       sgn     : array con las muestras de la se�al
%       fs      : Frecuencia a la que fue sampleada la se�al
%       modo    : par�metro del plot
%       polar   : 0 -> grafica parte real e imaginaria de la se�al
%                 1 -> grafica modulo y fase de la se�al
%                 2 -> Grafica solo m�dulo sin crear nueva figura
%
%   Par�metros de salida :
% 
%       signal      : Array de N muestras con la se�al
%       timeAxis    : Array de N muestras con el eje temporal
%
%   Fecha de creaci�n   : 08-04-2010
%   �ltima Modificaci�n : 27-05-2012
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [espectro img ] = PlotFFT2(sgn, fs, modo, polar, NF, NC, Ngraf)

%% Definici�n de par�metros :

margenY = 0.1 ;                                                 % Margen porcentual en el eje y

if(nargin < 5)
	NF = 2 ;                                                    % N�mero de filas del gr�fico
    NC = 1 ;                                                    % N�mero de columnas del gr�fico
end

%% Implementaci�n de la funci�n :

N = size(sgn ,2 ) ;

espectro = fft(sgn);                                            % Hago la fft de la se�al
% espectro = fftshift(espectro ) ;                              % Corro el espectro para que tenga su centro en cero

if(polar == 1 || polar == 2)                                    % Grafico polar : M�dulo y Fase
    
    modulo  = abs(espectro);                                    % Calculo el m�dulo de las muestras
    fase    = angle(espectro);                                  % Calculo la fase del espectro de la se�al
    
    max_mod = max(modulo);
    modulo_norm = modulo/max_mod;
    modulo_db = 10*log(modulo_norm);
    
    g1 = modulo_db ;
    g2 = fase ;
    
    titulo = 'M�dulo y Fase del Espectro de la Se�al' ;
    tit1 = 'M�dulo del espectro de la se�al' ;
    tit2 = 'Fase del espectro de la se�al' ;
    ylab1 = '|X(\omega)| [dB]' ;
    ylab2 = '\phi[X(\omega)] [rad]' ;
       
elseif (polar == 0 )                                            % Grafico cartesiano : parte real e imaginaria
    
    preal   = real (espectro ) ;                                % Calculo la parte real del espectro
    pimag   = imag (espectro ) ;                                % Calculo la parte imaginaria del espectro
    
    g1 = preal ;
    g2 = pimag ;
    
    titulo = 'Parte Real e Imaginaria del Espectro de la Se�al' ;
    tit1 = 'Parte Real del espectro de la se�al' ;
    tit2 = 'Parte Imaginaria del espectro de la se�al' ;
    
    ylab1 = 'Real [X(\omega) ]' ;
    ylab2 = 'Imag [X(\omega) ]' ;

end

% Escalo el eje de frecuencias en Hz

n = 0 : N - 1 ;                                                 % Eje con n�mero de muestras
n = n * (fs / N);
% n = n - N/2 ;                                                   % Muevo el eje al centro

%% Correci�n de m�rgenes

[max1 min1 ] = Margenes(g1, margenY ) ;
[max2 min2 ] = Margenes(g2, margenY ) ;


%% Gr�fico de las se�ales :

if(polar == 0 || polar == 1)
    if(nargin < 5)
        img = figure () ;                                                       % Obtengo el handler de la imagen       
    end
    % Primer Gr�fico :

    subplot (NF, NC, Ngraf) ;
    plot (n, g1, modo, 'LineWidth', 2 ) ;               
    grid on ;
    % xlim ([fmin fmax ] ) ;
    ylim ([min1 max1 ] ) ;

    xlabel ('f[Hz]' ) ;
    ylabel (ylab1) ;
    title(tit1 ) ;

    % Segundo Gr�fico :

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
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc. Ing. Franco Mart�n Pessana
%
%   function [maximo minimo] = Margenes(signal )
%
%   Par�metros de Entrada :
%
%           sgn                 : se�al a calcular los m�rgenes
%           margen_porcentual   : porcentaje respecto a los m�ximos
%
%   Par�metros de salida :
% 
%       maximo  : valor m�ximo del m�rgen del gr�fico
%       minimo  : valor m�nimo del m�rgen del gr�fico
%
%   Fecha de creaci�n   : 13-10-2010
%   �ltima Modificaci�n : 13-10-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

function [maximo minimo] = Margenes(sgn, margen_porcentual )

maximo = max(sgn );         % M�ximo de la se�al a graficar
minimo = min(sgn );         % M�nimo de la se�al a graficar

span = maximo - minimo ;    % Rango din�mico de la se�al

if(span == 0)
    span = 1 ;  % Fuerzo el span si las se�ales tienen sus muestras iguales
end

margen = margen_porcentual * abs(span ) ;

maximo = maximo + margen ;
minimo = minimo - margen ;

end