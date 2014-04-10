% -------------------------------------------------------------------------
%
%   Archivo:    Test_CWT.m
%
%   Descripci�n: Script de prueba de la funci�n propia my_cwt() contra la
%   funci�n de matlab cwt, con la ondita 'Morlet'.
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: Ing. BRUNO, Julian S. 
%   RT-DSP, Departamento de Ing.Electr�nica.
%   UTN-BA
%
% -------------------------------------------------------------------------

%% Inicializaci�n:

clc;                                                                        % Limpio el workspace
close all;                                                                  % Cierro todas las figuras
clear all;                                                                  % Cierro todas las variables

%% Sintetizo las funciones de prueba:


% Fs = 1300;
% N = 53;
% 
% A1 = 1;             A2 = 1;
% f01 = 0.5e3;        f02 = 0.8e3;
% ph01 = 0;           ph02 = 0;
% 
% h1 = mySin(A1, f01, ph01, N, Fs) + mySin(A1, 2 * f01, ph01, N, Fs);
% h2 = mySin(A2, f02, ph02, N, Fs);
% 
% h = [h1(1:(N/2))  h2((N/2)+1:N)];


Fs = 1000;
N = 200;
% h = mySin(0.5, 100, 0, N, Fs);
h = Cuadrada(N, 0.5, N, 50, 100);
k = 0:(length(h) - 1);                                                      % Array de muestras de la se�al a analizar

%% Seteo par�metros y ejecuto las funciones de MATLAB contra la propia:

a = [1];
%a = 0.5;

wavelet = 'morl';                                                           % Ondita propuesta en el enunciado

coef = cwt(h, a, wavelet);                                                  % Calculo los coeficientes.

w2 = @my_Morlet;
mycoef = my_cwt(h, a, w2);

%% Muestro resultados por consola:

coef_error = abs(coef - mycoef);
error_medio = mean(mean(coef_error));
error_max = max(max(coef_error));
error_acc = sum(sum(coef_error));

fprintf('\n\n----------------------------------------------------------------\n');
disp('Error en el c�lculo de coeficientes de matlab contra algoritmo: ');
disp('----------------------------------------------------------------');
disp(coef_error);

disp('----------------------------------------------------------------');
disp('              Valores caracter�sticos del error :');
disp('----------------------------------------------------------------');

fprintf('Error medio = %f \n', error_medio);
fprintf('Error maximo = %f \n', error_max);
fprintf('Error acumulado = %f \n', error_acc);
                

%% Grafico las se�ales:

NF = 1;
NC = 2;

fig0 = figure();
titulo = ('Se�al a analizar');
xlab = 't[s]';
ylab = 'h[t]';
mode = 0;
color = '-g';
subplot(NF, NC, 1); PlotTiempo(h, k, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 2); PlotFFT(h, Fs, titulo, 0, ylab);

% fig1 = figure();
% mesh(mycoef);
