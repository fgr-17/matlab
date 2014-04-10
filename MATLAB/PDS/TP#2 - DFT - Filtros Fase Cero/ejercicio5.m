%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #2 : DFT. Filtros de Fase Cero
%
%   Script del Ejercicio N�5 : 
%
%   5.  Filtrado por Nivel : El caso de Filtrado por nivel es un tipo de 
%   filtro especial que no tiene una determinada respuesta en frecuencia 
%   H(w) sino que deja pasar o no componentes de frecuencia de la se�al si 
%   est�n por encima de un determinado nivel L. Las componentes de 
%   frecuencia de la se�al (enti�ndase espectro de amplitud de la se�al) 
%   que no superen este nivel de umbral ser�n llevadas a cero. El espectro 
%   resultante se antitransforma y se obtiene la se�al filtrada. Tambi�n 
%   puede pensarse el nivel  L como un cierto porcentaje del contenido de 
%   energ�a de la se�al a filtrar, en cuyo caso, este nivel discriminar�a 
%   energ�a de la se�al y no solo su amplitud. Implemente un filtro por 
%   nivel que permita realizar alguna de estas dos opciones en la se�al a   
%   ser filtrada. 
% 
%   Fecha de creaci�n   : 13-10-2010
%   �ltima Modificaci�n : 17-01-2011
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

%% Inicializaci�n del script
% -------------------------------------------------------------------------
clc ;                       % Limpio el Command Window
close all ;                 % Cierro todas las ventanas
clear all ;                 % Limpio variables del Workspace

addpath     ./imgOut ;      % Directorio de almacenamiento de im�genes
addpath     ./fun ;         % Directorio de almacenamiento de funciones
addpath     ./sgnIn ;       

imagenesPath = './imgOut/' ;

%% Algoritmo del script
% -------------------------------------------------------------------------

fs = 1000;
L = 512 ;
A = 1 ;
N = 128 ;
duty = 70 ;

[x t] = Cuadrada(L, A, N, duty, fs) ;


% --------------------------------------
%   Calclulo par�metros de la se�al :
% --------------------------------------

len_sgn = size(x, 2) ;              % Longitud del archivo
max_sgn = max(x) ;                  % M�ximo de la se�al
med_sgn = mean(x);                  % Media de la se�al
var_sgn = var(x);                   % Desv�o est�ndar de la se�al

n_axis = 1:len_sgn ;                % Eje x del gr�fico

% -------------------------------------
%       Genero el ruido a sumar :
% -------------------------------------

SNR = 10;                                            % SNR[dB] de la se�al leida 
NIVEL_ELIM = 5;                                     % Nivel [dB] a eliminar

var_ruido      = var_sgn / ( 10 ^ ( SNR / 10)) ;    % Despejo la varianza del ruido
amplitud_ruido = (12 * var_ruido) ^ ( 1/2) ;        % Amplitud del ruido

% Genero la se�al de ruido a partir de los par�metros anteriores
sgn_ruido       = (rand ( 1, len_sgn) - 0.5) * amplitud_ruido;   
med_wn          = mean ( sgn_ruido) ;
var_ruido_med   = var ( sgn_ruido);                 % Desv�o est�ndar medido del ruido

sgn_tot = x + sgn_ruido ;                           % Se�al de ruido

SNR_medido = 10 * log10 ( var_sgn /var_ruido_med) ;

sgn_fil = FiltroNivel ( sgn_tot, NIVEL_ELIM) ;

%% Gr�fico de las diferentes se�ales:
% -------------------------------------------------------------------------

NF = 3;                    % Cantidad de filas del gr�fico
NC = 2;                    % Cantidad de columnas del gr�fico

% Grafico la se�al original sin el ruido :

N_PLOT_ORIG = 1;            % N�mero de gr�fico

subplot(NF, NC, N_PLOT_ORIG);
fig(N_PLOT_ORIG) = PlotTiempo(  x, n_axis, 'Se�al Original', 'n', ...
                                'x[k]', 0, 'g');
subplot(NF, NC, N_PLOT_ORIG + 1);                            
PlotFFT(x, fs, '.r', 2);
                
% Grafico la se�al con el ruido sumado :

N_PLOT_RUIDO = 3 ;

subplot ( NF, NC, N_PLOT_RUIDO) ;
fig (N_PLOT_RUIDO) = PlotTiempo(sgn_tot, n_axis, 'Se�al con Ruido SNR = 5dB', ...
                                  'n', 'x[k] + n[k]', 0, 'g');
subplot(NF, NC, N_PLOT_RUIDO + 1);                            
PlotFFT(sgn_tot, fs, '.r', 2);                              
                              
% Grafico la se�al filtrada por nivel :

N_PLOT_FIL = 5 ;

titulo_plot3 = sprintf('Se�al Filtrada al Nivel %d dB', NIVEL_ELIM);

subplot ( NF, NC, N_PLOT_FIL) ;
fig (N_PLOT_FIL) = PlotTiempo(sgn_fil, n_axis, titulo_plot3, 'n', 'y[k]', ...
                                0, 'g');                
subplot(NF, NC, N_PLOT_FIL + 1);                            
PlotFFT(sgn_fil, fs, '.r', 2);  

fig = gcf();
set(fig, 'Name', 'Filtro de Nivel aplicado a una se�al cuadrada:' );







