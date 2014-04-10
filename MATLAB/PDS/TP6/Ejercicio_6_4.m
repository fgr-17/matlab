% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_4.m
%
%   Enunciado:  4. Realice un programa en MatLab que permita ver en 3D la 
%   Transformada Ondita del ejercicio anterior. Utilice una determinada 
%   cantidad de desplazamientos temporales (32 por ejemplo), de manera tal 
%   de tener una aceptable resolución temporal
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

ta = 0;                                                                    % Tiempo de inicio del intervalo
tb = 2;                                                                     % Tiempo de fin del intervalo
N = 512;                                                                    % Cantidad de muestras del intervalo

dt = tb - ta;
Ts = dt/N;
Fs = 1/Ts;

t = ta:Ts:(tb - Ts);
% ---------------------- Parámetros de la venana de gabor ----------------------

a = 1/64;
t0_N = 32;

t0 = 0:(t0_N - 1);
t0 = t0 * dt / t0_N;

% ---------------------- Armo la señal a analizar ---------------------- 

fa = mySin(2, 64, 0, N, Fs);
fb = mySin(2, 16, 0, N, Fs);

f(1, 1:(N/2)) = fa(1:(N/2));
f(1, (N/2 + 1):N) = fb((N/2 + 1):N);

y = zeros(t0_N, N);                                                                     % Inicializo el array de señales de salida
modulo_db = zeros(t0_N, N);                                                             % Inicializo el array del espectro de señales de salida
for i = 1:t0_N

    [W tW]= my_Gabor_Win(a, t0(i), N, Fs);                                              % Ventana de análisis 
    y(i, :) = f .* W;                                                                   % Señal con la ventana aplicada
          
    modulo  = abs(y(i, :));                                                             % Calculo el módulo de las muestras
       
    max_mod = max(modulo);
    modulo_norm = modulo/max_mod;
    modulo_db(i, :) = modulo;%10*log(modulo_norm);
           
end


%% Grafico los resultados

freq = 0:(N - 1);
freq = freq * Fs;

mesh(t0, freq, modulo_db');

xlabel('t0 [s] (inicio de la ventana)');
ylabel('f [Hz]');
zlabel('F(w)*W[a, t0] (t)');

titulo = sprintf('Ventana de Gabor t0 = %f', t0(i));
set(gcf, 'Name', titulo);




