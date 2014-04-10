% -------------------------------------------------------------------------
%
%   Archivo:        Interpreting_CWT_Coefficients.m
%
%   Descripción:
%                   Código de la página:
%   http://www.mathworks.com/help/wavelet/gs/continuous-wavelet-transform.html#bsu1pdf
%
%   Autor:          ROUX, Federico G. (rouxfederico@gmail.com)
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

%% Armo la señal a analizar

x = zeros(1000,1);                                                          % Array de 1000 ceros
x(500) = 1;                                                                 % Con un delta en el centro

%% Guardo la ondita de análisis

[phi,psi,xval] = wavefun('haar',10);                                        
plot(xval,psi); axis([0 1 -1.5 1.5]);
title('Haar Wavelet');

%% Calculo la CWT

CWTcoeffs = cwt(x,1:128,'haar');

%% Grafico los resultados:

cwt(x,1:128,'haar','plot'); 
colormap jet; colorbar;

cwt(x,1:64,'haar','3Dplot'); colormap jet;

%% Grafico diferentes escalas por separado:

subplot(311)
plot(CWTcoeffs(10,:), '.g'); title('Scale 10');
subplot(312)
plot(CWTcoeffs(50,:), '.g'); title('Scale 50');
subplot(313)
plot(CWTcoeffs(90,:), '.g'); title('Scale 90');




