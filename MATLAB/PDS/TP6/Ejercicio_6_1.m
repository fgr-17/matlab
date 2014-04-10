% -------------------------------------------------------------------------
%
%   Archivo:    Ejercicio_6_1.m
%
%   Enunciado:  1. Observe la composici�n espectral de la ventana de Gabor. 
%   Visualice para distintos a y b como se va modificando el espectro de la 
%   misma. Tenga en cuenta el uso del comando MatLab fft para realizar estas 
%   operaciones, de tal manera de comparar estos resultados con sus 
%   correspondientes te�ricos. Recuerde que la ventana de Gabor, est� 
%   determinada por 2 par�metros, la dispersi�n y el desplazamiento de la 
%   misma.   
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

%% Calculo de la ventana de Gabor:

Fs = 10;
Ts = 1/Fs;
N = 64;

rep = 4;
a = [0.1    0.01         1          10];                                   % Array con los valores de dispersi�n
b = [0      Ts*(N/8)    Ts*(N/2)    Ts*(3*N/8)];                            % Array con los valores de retardo

w = [zeros(1, N); zeros(1, N); zeros(1, N); zeros(1, N)];                   % Inicializo el espacio

for i = 1:4
    a_i = a(i);
    b_i = b(i);
    [w_i t]= my_Gabor_Win(a_i, b_i, N, Fs);
    
    w(i, :) = w_i;
end


%% Grafico los resultados:

NF = rep;                                                                   % Cantidad de filas igual a la cantidad de ventanas generadas
NC = 3;                                                                     % Tres columnas, tiempo, frecuencia y fase

fig1 = figure();                                                            % Genero la nueva figura

for k = 1:3:(3 * rep)
    i = (k - 1)/3 + 1;
      
    titulo = sprintf('Ventana a = %.2f, b = %.2f', a(i), b(i));
    xlab = 'k';
    ylab = 'w[k]';
    mode = 1;
    color = '-g';
    subplot(NF, NC, k); PlotTiempo(w(i, :), t, titulo, xlab, ylab, mode, color);
    subplot(NF, NC, k + 1); PlotFFT2(w(i, :), Fs, '-b', 1, NF, NC, k + 1);
end

set(fig1, 'Name', 'Ventana de Gabor');