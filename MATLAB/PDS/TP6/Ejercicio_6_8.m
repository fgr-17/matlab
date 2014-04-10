% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_8.m
%
%   Enunciado:  8. Utilizando la señal del ejercicio 6, se pide filtrar la 
%   misma con el segundo método de visualización de la Transformada de Gabor 
%   (pero ahora vista como convolución de la señal a filtrar con la respuesta 
%   al impulso de filtros pasabandas). Utilice respuestas al impulso de 
%   ventanas de Gabor moduladas por frecuencias de de 32 y 16 y 8 Hz 
%   respectivamente, de forma tal de localizar en tiempo las distintas 
%   componentes de la señal h(t).
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Señales(PDS)
%   Departamento de Ing.Electrónica.
%   Facultad Buenos Aires
%   Universidad Tecnológica Nacional
%
% -------------------------------------------------------------------------

%% Inicialización:

clc;                                                                        % Limpio el workspace
close all;                                                                  % Cierro todas las figuras
clear all;                                                                  % Cierro todas las variables

%% Seteo los parámetros del ejercicio:

ta = 0;                                                                         % Tiempo de inicio del intervalo
tb = 3;                                                                         % Tiempo de fin del intervalo
N = 600;                                                                        % Cantidad de muestras del intervalo

dt = tb - ta;
Ts = dt/N;
Fs = 1/Ts;

t = ta : Ts : (tb - Ts);
% ---------------------- Parámetros de la venana de gabor ----------------------
    
a = 1/256;                                                                      % Compresión de la ventana

t0 = [0.5   1.5     2.5];                                                       % Desviación en tiempo 
f0 = [32    16      8];                                                         % Frecuencias modulantes

t0N = size(t0, 2);                                                              % Cantidad de desviaciones en tiempo
f0N = size(t0, 2);                                                              % Cantidad de modulaciones temporales


% ---------------------- Armo la señal a analizar ---------------------- 

ha = mySin(3, 8,  0, N, Fs);
hb = mySin(2, 16, 0, N, Fs);
hc = mySin(1, 32, 0, N, Fs);

h(1, 1:200)     = ha(1:200);
h(1, 201:400)   = hb(201:400);
h(1, 401:600)   = hc(401:600);

% ---------------------- Parametros del gráfico ---------------------- 

NF = t0N + 1;
NC = f0N;
xlab = 't[s]';


%% Grafico primero la señal a analizar:
titulo = 'Señal a analizar';
ylab = 'x(t)';
mode = 0;
color = '-b';
subplot(NF, NC, [1 3]);
PlotTiempo(h, t, titulo, xlab, ylab, mode, color);


for i = 1: t0N
    
    [W tW] = my_Gabor_Win(a, t0(i), N, Fs);                                     % Ventana de análisis
    
    for j = 1 : f0N
    
        fmod = mySin(1, f0(j), 0, N, Fs);                                       % Señal modulante 1
        Wmod = W .* fmod;

        y = filter(Wmod, 1, h);
        
        %% Grafico las señales de resultado:

        % ---------------------- Grafico la señal procesada ----------------------

        ind = (i - 1) * t0N + j + 3;
        
        titulo = sprintf('Señal de procesada t0 = %.1f[s] f0 = %.0f [Hz]', t0(i), f0(j));
        ylab = 'W * f(t)';
        mode = 0;
        color = '-g';
        subplot(NF, NC, ind); PlotFFT(y, Fs, titulo, mode, ylab)
        

    end    
    
end

titulo = sprintf('Segunda Aproximación T.Gabor');
set(gcf, 'Name', titulo);