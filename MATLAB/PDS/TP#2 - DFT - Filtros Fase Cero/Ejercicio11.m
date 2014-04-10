% -------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #2 : DFT. Filtros de Fase Cero
%
%   Script del Ejercicio N�6 : 
%
%   11.Considerando la secuencia del inciso anterior v[n], filtre la misma
%   mediante un filtro Pasa Bajos de Fase cero con un Angulo de Corte wC 
%   que debe determinar Ud. en base a los dictado en la teor�a, teniendo en
%   cuenta que deben ser cumplidas las longitudes L de las respuesta al 
%   impulso de los filtros. Observe los 3 resultados obtenidos. �Se ha 
%   conseguido la interpolaci�n de la se�al original a cada uno de los
%   puntos L seleccionados?
% 
%   Fecha de creaci�n   : 03-11-2011
%   �ltima Modificaci�n : 03-11-2011
%
%   Autor : ROUX, Federico (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
% -------------------------------------------------------------------------

%% Inicializaci�n del script
%  ------------------------------------------------------------------------
clc ;                       % Limpio el Command Window
close all ;                 % Cierro todas las ventanas
clear all ;                 % Limpio variables del Workspace

addpath     ./imgOut ;      % Directorio de almacenamiento de im�genes
addpath     ./fun ;         % Directorio de almacenamiento de funciones
addpath     ./sgnIn ;       

imagenesPath = './imgOut/' ;
signalsPath  = './sgnIn/' ;

%% C�lculo de par�metros de muestreo y muestreo de la se�al:
%  ------------------------------------------------------------------------
a   = 1 ;       % Coeficiente de atenuaci�n de la exponencial
t0  = -100 ;       % Instante inicial de la funci�n 
A   = 1 ;       % Constante de amplificaci�n de la se�al
N   = 64 ;     % Cantidad de muestras a tomar

fc = (a * ( 2^ ( 1/ 2) - 1) ^( 1/ 2) ) / (2 *pi) ;

fn = 10*fc ;       % Frecuencia de Nyquist 
fs = 2 *fn ;        % Frecuencia de Muestreo

[sgn t_sgn] = myExp (A, t0, a, N, fs) ;


%%                          Algoritmo del script
%  ------------------------------------------------------------------------
% Procesamiento de la se�al :

L = [2 4 10] ;          % Valores a submuestrear
L_len = size(L, 2);     % Tama�o del array de valores de submuestreo

xN = size(sgn, 2);
t_sgn = 0:(xN - 1);

NF = 1 + L_len;         % Cantidad de filas a graficar
NC = 2;

subplot(NF, NC, 1);
PlotTiempo(sgn, t_sgn, 'Se�al Original', 'n', 'x[k]', 0, '.g');
subplot(NF, NC, 2);
[sgn_espectro fig0] = PlotFFT(sgn, fs, '.r', 2) ;

hN = 64;            % Cantidad de muestras del filtro

for L_ind = 1:L_len
    
    sob_sgn_no_filtrada = upsample(sgn, L(L_ind));      % Funci�n de matlab

    xN_sob_sgn_no_filtrada = size(sob_sgn_no_filtrada, 2);
    
    wC = pi/L(L_ind);
    
    [h H] = pasabajos_ideal(wC, hN);
    
    % sob_sgn = Filtrar_Fase_Cero(h, 1, sob_sgn_no_filtrada);
    sob_sgn = filter(h, 1, sob_sgn_no_filtrada);
    
    fs_subM = fs / L(L_ind) ;
    xN_SubM = size(sob_sgn, 2);
    t_SubM  = 0:(xN_SubM - 1);
    
    subplot(NF, NC, ((L_ind*2)+1));
    titulo_plot = sprintf('Se�al sobremuestreada L = %d', L(L_ind));
    PlotTiempo(sob_sgn, t_SubM, titulo_plot, 'n', 'x[k]', 0, '.g');
    subplot(NF, NC, ((L_ind * 2) + 2));
    [sgn_espectro fig0] = PlotFFT(sob_sgn, fs, '.r', 2) ;
       
end