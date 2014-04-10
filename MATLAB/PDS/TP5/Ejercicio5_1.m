%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo:    Ejercicio5_1.m
%
%   Enunciado:  Dado el siguiente combinador lineal adaptativo, 
%   donde la entrada es x[k] = sin(2.pi.k/N) y la salida desesada es 
%   d[k] = 2.cos(2.pi.k/N), se pide encontrar los pesos de este FIR 
%   adaptativo para conseguir dicha salida. Calcule adem�s la superficie de
%   error cuadr�tico medio y encuentre su m�nimo valor. Observe que con tan
%   s�lo un retardo y dos pesos, puede conseguirse un cambio de fase y 
%   amplitud de la se�al de entrada x[k] a la deseada d[k].
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Se�ales(PDS)
%   Departamento de Ing.Electr�nica.
%   Facultad Buenos Aires
%   Universidad Tecnol�gica Nacional
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Comentarios sobre la resoluci�n del ejercicio:
% 
% La f�rmula para calcular los coeficientes �ptimos de un filtro FIR, que
% generen el m�nimo error con respecto a una se�al deseada, se obtiene
%
%   Bopt = R^(-1)*P
%
% Donde:    Bopt : Coeficientes �ptimos del filtro.
%           R    : Matriz de autocorrelaci�n de x[k]
%           P    : Matriz de correlaci�n cruzada entre x[k] y d[k]
%
% Para resolver �ste ejercicio no trabaj� con el algoritmo LMS, sino con
% las ecuaciones originales, para contrastar los resultados.

%% Inicializaci�n del script:

clc;                % Limpio el workspace
close all;

orden = 1;          % Orden del filtro
mu = 0.05;

%% Genero las se�ales de entrada

% Genero la funci�n x[k] entrada senoidal:

A_x   = 1;              % Amplitud de la se�al
f0_x  = 200;            % Frecuencia fundamental 1Hz
ph0_x = 0;              % Fase inicial de la se�al
xN    = 500;           % Cantidad de muestras del array
fs_x  = 10 * f0_x;      % Frecuencia de muestreo

x = mySin(A_x, f0_x, ph0_x, xN, fs_x);

% Genero la funci�n d[k] funci�n deseada a adaptar:

A_d   = 2;              % Amplitud de la se�al deseada
f0_d  = f0_x;           % Frec. fundamental de la se�al deseada
ph0_d = ph0_x + pi/4;   % Fase 90� para que sea funci�n cosenoidal
dN    = xN;             % Cantidad de muestras
fs_d  = 10 * f0_d;      % Frecuencia de muestreo

d = mySin(A_d, f0_d, ph0_d, dN, fs_d);

%% Adaptaci�n del filtro:

% Calculo el peso de los coeficientes:
[B y e] = Adaptar_Coeficientes_FIR(x, d, orden, mu);

% Vuelvo a filtrar la se�al con los pesos ya asignados:
y_final = filter(B, 1, x);

% Calculo el error sobre la se�al final:
e_final = d - y_final;

%% Grafico los resultados obtenidos:

fig1 = figure();    % Obtengo el handler de la figura
rotulo = sprintf('Filtro Adaptativo mu = %f. fs = %dkHz. Cambio de fase y amplitud adaptativa', mu, fs/1000);
set(fig1,'name',rotulo);

NF = 4;
NC = 2;

subplot(NF, NC, [1 2]);
plot(x);
title('Se�al de entrada');

subplot(NF, NC, [3 4]);
plot(d);
title('Se�al deseada');

subplot(NF, NC, [5 6]);
plot(y);
title('Se�al de salida');

subplot(NF, NC, [7 8]);
plot(e);
title('Se�al de error');

