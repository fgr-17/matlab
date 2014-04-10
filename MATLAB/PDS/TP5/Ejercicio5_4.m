%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo:    Ejercicio5_4.m
%
%   Enunciado:  Para el siguiente filtro recursivo IIR, se desea estimar 
%   los coeficientes del mismo mediante t�cnicas adaptativas (es decir, 
%   comparar estos coeficientes con el vector adaptativo de pesos obtenido)
%   si la entrada al mismo es Ruido Blanco Gaussiano con las siguientes 
%   caracter�sticas: mu=0 y sd=0.5. Dise�e una funci�n MatLab.
%
%                ----------------------------
%               |             1              |
%   x[k] ------>|   -----------------------  |----> y[k]
%               |   1 - 1.2z^(-1) + 0.6z^(-2)|
%                ----------------------------
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Se�ales(PDS)
%   Departamento de Ing.Electr�nica.
%   Facultad Buenos Aires
%   Universidad Tecnol�gica Nacional
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Inicializaci�n:

clc;                        % Limpio el workspace
close all;                  % Cierro todas las figuras
clear all;                  % Cierro todas las variables

%% Datos del enunciado:

fs = 1e3;                   % Frecuencia de muestreo        [Hz]

xN = 10000;                  % Cantidad de muestras de la se�al de entrada

des_std_1 = 0.5;            % Desv�o est�ndar del ruido gaussiano

x = wgn(1, xN, des_std_1, 'linear');        % Genero el ruido blanco

t = 0 : (xN - 1);           % Eje de muestras
t = t/fs;                   % Eje temporal

%% Resoluci�n del ejercicio:
%
% Coeficientes del filtro a adaptar

B = [1   0      0];
A = [1  -1.2    0.6];

% La se�al deseada es la se�al de entrada filtrada por el bloque anterior:
d = filter(B, A, x);

% Una vez que tengo la se�al de entrada y la deseada, elijo el orden del
% filtro y la velocidad de convergencia, y hago el procesamiento LMS:
x_fft = fft(x);
x_pot = sum(abs(x_fft).^2) ^ (0.5);

orden = 2;
%mu = 100/(20 * (orden + 1) * x_pot);
mu = 0.01;

[Bk Ak yk ek] = Adaptar_Coeficientes_IIR(x, d, orden, mu);

%% Devuelvo los resultados del algoritmo por consola

disp('Los coeficientes del numerador son:');
linea1 = sprintf( '%f\n', Bk);
disp(linea1);

disp('Los coeficientes del denominador son:');
linea2 = sprintf( '%f\n', Ak);
disp(linea2);

%% Gr�fico las se�ales de trabajo

fig1 = figure();    % Obtengo el handler de la figura
rotulo = sprintf('Filtro Adaptativo mu = %f. fs = %dkHz sd = %.2f. Identificaci�n de un filtro digital con ruido blanco', mu, fs/1000, des_std_1);
set(fig1,'name',rotulo);

NF = 4;             % Cantidad de filas del gr�fico
NC = 2;             % Cantidad de columnas del gr�fico

subplot(NF, NC, 1);
PlotTiempo(x, t, 'Se�al de entrada x[n]', 't', 'x[n]', 0, 'g');
subplot(NF, NC, 2);
PlotFFT(x, fs, 'Espectro de la se�al de entrada X[k]', 1, 'X[k]');

subplot(NF, NC, 3);
PlotTiempo(d, t, 'Se�al deseada d[n]', 't', 'd[n]', 0, 'g');
subplot(NF, NC, 4);
PlotFFT(d, fs, 'Espectro de la se�al de deseada D[k]', 1, 'D[k]');

subplot(NF, NC, 5);
PlotTiempo(yk, t, 'Se�al filtrada y[n]', 't', 'y[n]', 0, 'g');
subplot(NF, NC, 6);
PlotFFT(yk, fs, 'Espectro de la se�al filtrada Y[k]', 1, 'Y[k]');

subplot(NF, NC, [7 8]);
PlotTiempo(ek, t, 'Se�al de error e[n]', 't', 'e[n]',0, 'g');