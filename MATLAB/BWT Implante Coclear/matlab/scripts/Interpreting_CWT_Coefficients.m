% -------------------------------------------------------------------------
%
%   Archivo:        Interpreting_CWT_Coefficients.m
%
%   Descripci�n:
%                   C�digo de la p�gina:
%   http://www.mathworks.com/help/wavelet/gs/continuous-wavelet-transform.html#bsu1pdf
%
%   Autor:          ROUX, Federico G. (rouxfederico@gmail.com)
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

%% Armo la se�al a analizar

x = zeros(1000,1);                                                          % Array de 1000 ceros
x(500) = 1;                                                                 % Con un delta en el centro

%% Guardo la ondita de an�lisis

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




