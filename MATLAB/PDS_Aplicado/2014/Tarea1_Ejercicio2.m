%%=========================================================================
%   
%>  @file   Extraer_Componentes_Fourier.m
%
%>  @brief  Extrae las componentes de N armónicas de una señal. La
%>  @brief  señal a analizar se guarda en la variable "s2", y se deben setear las
%>  @brief  variables t0, tf y N_ciclos con el momento inicial y final de una serie
%>  @brief  de períodos, y la cantidad de ciclos encerrados en esa ventana de
%>  @brief  tiempo. El resto del script se genera automáticamente, se extraen las
%>  @brief  componentes de Fourier en módulo y fase y se genera la señal
%>  @brief  sintetizada como suma de senoidales. También se muestran los datos
%>  @brief  obtenidos en el workspace.
%
%>  @date       12.02.2014
%
%>  @author     Federico Roux (froux@favaloro.edu.ar)
%>  @company    Laboratorio de uP. Universidad Favaloro 
%==========================================================================

%% Parámetros del ejercicio:
close all;                                                                  


% Seteo los parámetros de la señal muestreada:
Fs = 500;                                                                   % Frecuencia de muestreo
N = length(s2);                                                             % Longitud de la señal
Res_f = Fs / N;                                                             % Resolución frecuencial de la FFT

[X f] = Grafico_Frecuencial(s2, Fs, '.b', 1);

% Parámetros de la serie de Fourier:

N_armonicas = 5;

%% Extraigo parámetros de la señal a sintetizar:

% Levanto la señal s2 en memoria con Fs = 500Hz : Datos obtenidos del
% gráfico:
t0 = 0.314;                                                                 % T0 del primer ciclo
tf = 5.7;                                                                   % Final del último ciclo
Dt = tf - t0;                                                               % Espacio de tiempo 
N_ciclos = 9;                                                               % Cantidad de ciclos encerrados
T_prom = Dt / N_ciclos;                                                     % Período promedio
f0 = 1/T_prom;                                                              % Frecuencia fundamental promedio


%% Sintetizo la señal anterior mediante serie de Fourier:

i = 1:N_armonicas;                                                          % Array de números ordenados con las armónicas a extraer
k = 1 + fix((f0*i)/Res_f);                                                  % Extraigo las muestras del espectro que corresponden a la serie de Fourier

mod = abs(X);                                                               % Armo un array de módulo del espectro
ang = angle(X);                                                             % Armo un array de fase del espectro

A = (pi*mod(k)) / N;                                                        % Array de módulo de coeficientes de Fourier
ph = ang(k);                                                                % Array de fase de coeficientes de Fourier

sen = zeros(N_armonicas, N);                                                % Inicializo con ceros la serie de señales a sumar 
A0 = mean(s2);                                                              % Calculo el nivel de contínua de la señal (promedio)

for j = 1:N_armonicas                                                       % Recorro el array de armónicas
    sen(j, :) = sSenoidal(A(j), f0*j, ph(j), N, Fs);                        % Genero una señal senoidal con cada amplitud, fase y armónica de f0
end

serie_f = A0 + sum(sen);                                                    % Sintetizo la serie de Fourier con la contínua más la suma de senoidales generadas

%% Muestro los resultados en gráficos y workspace:

fig = figure();

Grafico_Temporal(serie_f, Fs, 0, 'Señal sintetizada', 't[s]', 'snl[k]', ...
                 '-b', 0, 'Sintesis de una señal a partir de la Serie de Fourier');
hold on;
Grafico_Temporal(s2, Fs, 0, 'Señal sintetizada', 't[s]', 'snl[k]', ...
                 '-g', 0, 'Sintesis de una señal a partir de la Serie de Fourier');

clc;
disp('     Coeficientes de la señal analizada');
disp('----------------------------------------------');
fprintf('A[0] = %f\n' , A0);
for i =1:N_armonicas
    fprintf('A[%d] = %f \t\t ph[%d] = %f\n', i, A(i), i, ph(i));
end

             