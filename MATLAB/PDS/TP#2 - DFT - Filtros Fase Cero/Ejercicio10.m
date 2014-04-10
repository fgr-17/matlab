% -------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Trabajo Práctico #2 : DFT. Filtros de Fase Cero
%
%   Script del Ejercicio N°6 : 
%
%   10.Genere la siguiente senal discreta:
%               _
%              | x[n/L], n = kL   
%       v[n] = |
%              |_0, para otro n
%   para valores de L = 2; L = 4 y L =10 , es decir, como el bloque 
%   sobremuetreador visto en la teoria. Investigue se existe una funcion 
%   MatLab que realice esta operacion, sin necesidad de generar su propio 
%   código. Luego, observe el espectro de Fourier obtenido para cada uno de
%   estos sobremuestreos. .Que observa respecto al espectro del inciso 6? 
% 
%   Fecha de creación   : 19-01-2011
%   Última Modificación : 19-01-2011
%
%   Autor : ROUX, Federico (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
% -------------------------------------------------------------------------

%% Inicialización del script
%  ------------------------------------------------------------------------
clc ;                       % Limpio el Command Window
close all ;                 % Cierro todas las ventanas
clear all ;                 % Limpio variables del Workspace

addpath     ./imgOut ;      % Directorio de almacenamiento de imágenes
addpath     ./fun ;         % Directorio de almacenamiento de funciones
addpath     ./sgnIn ;       

imagenesPath = './imgOut/' ;
signalsPath  = './sgnIn/' ;

%% Cálculo de parámetros de muestreo y muestreo de la señal:
%  ------------------------------------------------------------------------
a   = 1 ;       % Coeficiente de atenuación de la exponencial
t0  = -100 ;       % Instante inicial de la función 
A   = 1 ;       % Constante de amplificación de la señal
N   = 64 ;     % Cantidad de muestras a tomar

fc = (a * ( 2^ ( 1/ 2) - 1) ^( 1/ 2) ) / (2 *pi) ;

fn = 10*fc ;       % Frecuencia de Nyquist 
fs = 2 *fn ;        % Frecuencia de Muestreo

[sgn t_sgn] = myExp (A, t0, a, N, fs) ;


%%                          Algoritmo del script
%  ------------------------------------------------------------------------
% Procesamiento de la señal :

L = [2 4 10] ;          % Valores a submuestrear
L_len = size(L, 2);     % Tamaño del array de valores de submuestreo

xN = size(sgn, 2);
t_sgn = 0:(xN - 1);

NF = 1 + L_len;         % Cantidad de filas a graficar
NC = 2;

subplot(NF, NC, 1);
PlotTiempo(sgn, t_sgn, 'Señal Original', 'n', 'x[k]', 0, '.g');
subplot(NF, NC, 2);
[sgn_espectro fig0] = PlotFFT(sgn, fs, '.r', 2) ;

for L_ind = 1:L_len

    sob_sgn = upsample(sgn, L(L_ind));      % Función de matlab

    fs_subM = fs / L(L_ind) ;
    xN_SubM = size(sob_sgn, 2);
    t_SubM  = 0:(xN_SubM - 1);
    
    subplot(NF, NC, ((L_ind*2)+1));
    titulo_plot = sprintf('Señal sobremuestreada L = %d', L(L_ind));
    PlotTiempo(sob_sgn, t_SubM, titulo_plot, 'n', 'x[k]', 0, '.g');
    subplot(NF, NC, ((L_ind * 2) + 2));
    [sgn_espectro fig0] = PlotFFT(sob_sgn, fs, '.r', 2) ;
       
end