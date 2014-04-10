% -------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Trabajo Práctico #2 : DFT. Filtros de Fase Cero
%
%   Script del Ejercicio N°7 : 
%
%   8. Considerando la secuencia original x[n] = x(n.Ts), filtre la misma 
%   mediante un filtro Pasa Bajos de Fase cero con un Angulo de Corte de
%   wc = pi/M , con los valores de M del inciso anterior. Observe los 3 
%   resultados obtenidos. A esta señal filtrada denomínela m[n].
%   9.Para cada una de las señales v[n] filtradas del inciso anterior, 
%   nuevamente realice un submuestreo de las mismas al igual que en el 
%   inciso 2, es decir y [n] v[nM] S = , con M = 2; M = 4 y M = 10 . Para 
%   cada una de estas secuencias filtradas y submuestreadas, obtenga su 
%   espectro de Fourier y compare estos resultados con los obtenidos en el 
%   inciso 1. ¿Qué puede concluir al respecto?
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

%% Algoritmo del script
%  ------------------------------------------------------------------------

% Cargo la señal previamente generada:

archivo_nom = 'sgn_myExp.mat' ;         
path_sgn    = sprintf ('%s%s', signalsPath, archivo_nom) ;

load(path_sgn) ;  

% Procesamiento de la señal :

M = [2 4 10] ;          % Valores a submuestrear
M_len = size(M, 2);     % Tamaño del array de valores de submuestreo

L = size(sgn, 2);
t_sgn = 0:(L-1);

NF = 1 + M_len;         % Cantidad de filas a graficar
NC = 2;

subplot(NF, NC, 1);
PlotTiempo(sgn, t_sgn, 'Señal Original', 'n', 'x[k]', 0, '.g');
subplot(NF, NC, 2);
[sgn_espectro fig0] = PlotFFT(sgn, fs, '.r', 2) ;

for M_ind = 1:M_len

    Nf = 8;
    wc = pi /M(M_ind);                  % Frecuencia de corte antialias
    [h H] = pasabajos_ideal(wc, Nf);    % Calculo los coeficientes del filtro
    
    sgn_SubM_manual = SubMuestrear(sgn, M (M_ind)) ;    % Función implementada
    sgn_SubM_matlab = downsample(  sgn, M (M_ind)) ;    % Función de matlab

    error_fun = sum(sgn_SubM_matlab - sgn_SubM_manual) ;  % Deberia ser cero

    if error_fun ~= 0
        disp ('Error en la función SubMuestrear') ;
        return ;
    end
    
    %sgn_SubM_manual = Filtrar_Fase_Cero(h, 1, sgn_SubM_manual);
    sgn_SubM_manual = filter(h, 1, sgn_SubM_manual);
    
    fs_subM = fs / M(M_ind) ;
    L_SubM = size(sgn_SubM_manual, 2);
    t_SubM = 0:(L_SubM - 1);
    
    subplot(NF, NC, ((M_ind*2)+1));
    titulo_plot = sprintf('Señal submuestreada M = %d', M(M_ind));
    PlotTiempo(sgn_SubM_manual, t_SubM, titulo_plot, 'n', 'x[k]', 0, '.g');
    subplot(NF, NC, ((M_ind*2)+2));
    [sgn_espectro fig0] = PlotFFT(sgn_SubM_manual, fs, '.r', 2) ;
    
    
end