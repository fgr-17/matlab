%-------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Trabajo Práctico #2 : DFT. Filtros de Fase Cero
%
%   Script del Ejercicio N°5 : 
%
%   5.  Filtrado por Nivel : El caso de Filtrado por nivel es un tipo de 
%   filtro especial que no tiene una determinada respuesta en frecuencia 
%   H(w) sino que deja pasar o no componentes de frecuencia de la señal si 
%   están por encima de un determinado nivel L. Las componentes de 
%   frecuencia de la señal (entiéndase espectro de amplitud de la señal) 
%   que no superen este nivel de umbral serán llevadas a cero. El espectro 
%   resultante se antitransforma y se obtiene la señal filtrada. También 
%   puede pensarse el nivel  L como un cierto porcentaje del contenido de 
%   energía de la señal a filtrar, en cuyo caso, este nivel discriminaría 
%   energía de la señal y no solo su amplitud. Implemente un filtro por 
%   nivel que permita realizar alguna de estas dos opciones en la señal a   
%   ser filtrada. 
% 
%   Fecha de creación   : 13-10-2010
%   Última Modificación : 17-01-2011
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
%-------------------------------------------------------------------------

%% Inicialización del script
% -------------------------------------------------------------------------
clc ;                       % Limpio el Command Window
close all ;                 % Cierro todas las ventanas
clear all ;                 % Limpio variables del Workspace

addpath     ./imgOut ;      % Directorio de almacenamiento de imágenes
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
%   Calclulo parámetros de la señal :
% --------------------------------------

len_sgn = size(x, 2) ;              % Longitud del archivo
max_sgn = max(x) ;                  % Máximo de la señal
med_sgn = mean(x);                  % Media de la señal
var_sgn = var(x);                   % Desvío estándar de la señal

n_axis = 1:len_sgn ;                % Eje x del gráfico

% -------------------------------------
%       Genero el ruido a sumar :
% -------------------------------------

SNR = 10;                                            % SNR[dB] de la señal leida 
NIVEL_ELIM = 5;                                     % Nivel [dB] a eliminar

var_ruido      = var_sgn / ( 10 ^ ( SNR / 10)) ;    % Despejo la varianza del ruido
amplitud_ruido = (12 * var_ruido) ^ ( 1/2) ;        % Amplitud del ruido

% Genero la señal de ruido a partir de los parámetros anteriores
sgn_ruido       = (rand ( 1, len_sgn) - 0.5) * amplitud_ruido;   
med_wn          = mean ( sgn_ruido) ;
var_ruido_med   = var ( sgn_ruido);                 % Desvío estándar medido del ruido

sgn_tot = x + sgn_ruido ;                           % Señal de ruido

SNR_medido = 10 * log10 ( var_sgn /var_ruido_med) ;

sgn_fil = FiltroNivel ( sgn_tot, NIVEL_ELIM) ;

%% Gráfico de las diferentes señales:
% -------------------------------------------------------------------------

NF = 3;                    % Cantidad de filas del gráfico
NC = 2;                    % Cantidad de columnas del gráfico

% Grafico la señal original sin el ruido :

N_PLOT_ORIG = 1;            % Número de gráfico

subplot(NF, NC, N_PLOT_ORIG);
fig(N_PLOT_ORIG) = PlotTiempo(  x, n_axis, 'Señal Original', 'n', ...
                                'x[k]', 0, 'g');
subplot(NF, NC, N_PLOT_ORIG + 1);                            
PlotFFT(x, fs, '.r', 2);
                
% Grafico la señal con el ruido sumado :

N_PLOT_RUIDO = 3 ;

subplot ( NF, NC, N_PLOT_RUIDO) ;
fig (N_PLOT_RUIDO) = PlotTiempo(sgn_tot, n_axis, 'Señal con Ruido SNR = 5dB', ...
                                  'n', 'x[k] + n[k]', 0, 'g');
subplot(NF, NC, N_PLOT_RUIDO + 1);                            
PlotFFT(sgn_tot, fs, '.r', 2);                              
                              
% Grafico la señal filtrada por nivel :

N_PLOT_FIL = 5 ;

titulo_plot3 = sprintf('Señal Filtrada al Nivel %d dB', NIVEL_ELIM);

subplot ( NF, NC, N_PLOT_FIL) ;
fig (N_PLOT_FIL) = PlotTiempo(sgn_fil, n_axis, titulo_plot3, 'n', 'y[k]', ...
                                0, 'g');                
subplot(NF, NC, N_PLOT_FIL + 1);                            
PlotFFT(sgn_fil, fs, '.r', 2);  

fig = gcf();
set(fig, 'Name', 'Filtro de Nivel aplicado a una señal cuadrada:' );







