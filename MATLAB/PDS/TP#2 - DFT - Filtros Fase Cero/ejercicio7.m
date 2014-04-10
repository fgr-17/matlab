% -------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #2 : DFT. Filtros de Fase Cero
%
%   Script del Ejercicio N�7 : 
%
%   7. Genere ahora una nueva se�al discreta  y[n] = x[nM], con M = 10, 4 y 
%   M = 2, es decir, como el bloque submuestreador visto en  la teor�a. 
%   Investigue se existe una funci�n MatLab que realice esta operaci�n, sin 
%   necesidad de generar su propio c�digo. Luego, observe el espectro de 
%   Fourier (al igual que en el inciso anterior) obtenido para cada uno de 
%   estos submuestreos. 
% 
%   Fecha de creaci�n   : 19-01-2011
%   �ltima Modificaci�n : 19-01-2011
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

%% Algoritmo del script
%  ------------------------------------------------------------------------

% Cargo la se�al previamente generada:

archivo_nom = 'sgn_myExp.mat' ;         
path_sgn    = sprintf ('%s%s', signalsPath, archivo_nom) ;

load(path_sgn) ;  

% Procesamiento de la se�al :

M = [2 4 10] ;          % Valores a submuestrear
M_len = size(M, 2);     % Tama�o del array de valores de submuestreo

L = size(sgn, 2);
t_sgn = 0:(L-1);

NF = 1 + M_len;         % Cantidad de filas a graficar
NC = 2;

subplot(NF, NC, 1);
PlotTiempo(sgn, t_sgn, 'Se�al Original', 'n', 'x[k]', 0, '.g');
subplot(NF, NC, 2);
[sgn_espectro fig0] = PlotFFT(sgn, fs, '.r', 2) ;

for M_ind = 1:M_len

    sgn_SubM_manual = SubMuestrear(sgn, M (M_ind)) ;    % Funci�n implementada
    sgn_SubM_matlab = downsample(  sgn, M (M_ind)) ;    % Funci�n de matlab

    error_fun = sum(sgn_SubM_matlab - sgn_SubM_manual) ;  % Deberia ser cero

    if error_fun ~= 0
        disp ('Error en la funci�n SubMuestrear') ;
        return ;
    end
    
    fs_subM = fs / M(M_ind) ;
    L_SubM = size(sgn_SubM_manual, 2);
    t_SubM = 0:(L_SubM - 1);
    
    subplot(NF, NC, ((M_ind*2)+1));
    titulo_plot = sprintf('Se�al submuestreada M = %d', M(M_ind));
    PlotTiempo(sgn_SubM_manual, t_SubM, titulo_plot, 'n', 'x[k]', 0, '.g');
    subplot(NF, NC, ((M_ind*2)+2));
    [sgn_espectro fig0] = PlotFFT(sgn_SubM_manual, fs, '.r', 2) ;
    
    
end