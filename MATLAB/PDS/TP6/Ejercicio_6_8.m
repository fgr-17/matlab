% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_8.m
%
%   Enunciado:  8. Utilizando la se�al del ejercicio 6, se pide filtrar la 
%   misma con el segundo m�todo de visualizaci�n de la Transformada de Gabor 
%   (pero ahora vista como convoluci�n de la se�al a filtrar con la respuesta 
%   al impulso de filtros pasabandas). Utilice respuestas al impulso de 
%   ventanas de Gabor moduladas por frecuencias de de 32 y 16 y 8 Hz 
%   respectivamente, de forma tal de localizar en tiempo las distintas 
%   componentes de la se�al h(t).
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Se�ales(PDS)
%   Departamento de Ing.Electr�nica.
%   Facultad Buenos Aires
%   Universidad Tecnol�gica Nacional
%
% -------------------------------------------------------------------------

%% Inicializaci�n:

clc;                                                                        % Limpio el workspace
close all;                                                                  % Cierro todas las figuras
clear all;                                                                  % Cierro todas las variables

%% Seteo los par�metros del ejercicio:

ta = 0;                                                                         % Tiempo de inicio del intervalo
tb = 3;                                                                         % Tiempo de fin del intervalo
N = 600;                                                                        % Cantidad de muestras del intervalo

dt = tb - ta;
Ts = dt/N;
Fs = 1/Ts;

t = ta : Ts : (tb - Ts);
% ---------------------- Par�metros de la venana de gabor ----------------------
    
a = 1/256;                                                                      % Compresi�n de la ventana

t0 = [0.5   1.5     2.5];                                                       % Desviaci�n en tiempo 
f0 = [32    16      8];                                                         % Frecuencias modulantes

t0N = size(t0, 2);                                                              % Cantidad de desviaciones en tiempo
f0N = size(t0, 2);                                                              % Cantidad de modulaciones temporales


% ---------------------- Armo la se�al a analizar ---------------------- 

ha = mySin(3, 8,  0, N, Fs);
hb = mySin(2, 16, 0, N, Fs);
hc = mySin(1, 32, 0, N, Fs);

h(1, 1:200)     = ha(1:200);
h(1, 201:400)   = hb(201:400);
h(1, 401:600)   = hc(401:600);

% ---------------------- Parametros del gr�fico ---------------------- 

NF = t0N + 1;
NC = f0N;
xlab = 't[s]';


%% Grafico primero la se�al a analizar:
titulo = 'Se�al a analizar';
ylab = 'x(t)';
mode = 0;
color = '-b';
subplot(NF, NC, [1 3]);
PlotTiempo(h, t, titulo, xlab, ylab, mode, color);


for i = 1: t0N
    
    [W tW] = my_Gabor_Win(a, t0(i), N, Fs);                                     % Ventana de an�lisis
    
    for j = 1 : f0N
    
        fmod = mySin(1, f0(j), 0, N, Fs);                                       % Se�al modulante 1
        Wmod = W .* fmod;

        y = filter(Wmod, 1, h);
        
        %% Grafico las se�ales de resultado:

        % ---------------------- Grafico la se�al procesada ----------------------

        ind = (i - 1) * t0N + j + 3;
        
        titulo = sprintf('Se�al de procesada t0 = %.1f[s] f0 = %.0f [Hz]', t0(i), f0(j));
        ylab = 'W * f(t)';
        mode = 0;
        color = '-g';
        subplot(NF, NC, ind); PlotFFT(y, Fs, titulo, mode, ylab)
        

    end    
    
end

titulo = sprintf('Segunda Aproximaci�n T.Gabor');
set(gcf, 'Name', titulo);