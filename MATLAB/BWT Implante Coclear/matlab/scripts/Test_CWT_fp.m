%% =========================================================================================================================================
%>  @file       Test_CWT_fp.m
%
%>  @brief      Script de prueba de la funcion propia my_cwt() contra la funcion de matlab cwt, con la ondita 'Morlet'.
%
%>  @author     Federico Roux (rouxfederico@gmail.com)
%>  @company    RT-DSP UTN.BA
% =========================================================================================================================================

%% Inicializacion:

clc;                                                                        % Limpio el workspace
close all;                                                                  % Cierro todas las figuras
clear all;                                                                  % Cierro todas las variables

%% Sintetizo funciones de prueba:

Fs = 1000;                                                                  % Frecuencia de muestreo
N = 200;                                                                    % Cantidad de muestras
h = Cuadrada(N, 0.5, N/8, 45, 100);                                         % Sintetizo una señal cuadrada

%% Parámetros de simulación del algoritmo:
L = length(h);
k = 0:(L - 1);                                                              % Genero array de muestras de la señal
wL = 1024;                                                                  % Largo de la wavelet a generar
li = -8;
ls = 8;
% a = [1 8 20 40] ;
a = 1;                                                                      % Escalas elegidas
wavelet = @my_Morlet;                                                       % Ondita elegida                                                            

[w tw]= my_Morlet(li, ls, wL);                                              % Creo la wavelet afuera de las funciones de analisis

coef    =  my_cwt   (h, a, wavelet);                                        % Calculo los coeficientes en pto. flotante
coef_fp =  my_cwt_fp(h, a, wavelet);                                        % Calculo los coeficientes en punto fijo

f_asc = scal2frq(a, 'morl', Fs);
disp('Escala    Frec.')
disp([a' f_asc']);

%% Muestro resultados por consola:

coef_error = abs(coef - coef_fp.data);                                      % Calculo el error entre los coeficientes en FP y en flotante
error_medio = mean(mean(coef_error));                                       % Calculo la media del error
error_max = max(max(abs(coef_error)));                                      % Calculo el error maximo
error_min = min(min(abs(coef_error)));                                      % Calculo el error mínimo

coef_error_rel = (coef_error ./ coef_fp.data)*100;                          % Calculo errores relativos
% coef_error_rel = (coef_error ./ coef)*100;                                % Calculo errores relativos
error_rel_medio = mean(mean(coef_error_rel));                               % Calculo el error relativo medio
error_rel_max = max(max(coef_error_rel));                                   % Calculo el error relativo maximo

%{
disp('----------------------------------------------------------------');
disp('Error en el calculo de coeficientes en punto fijo: ');
disp('----------------------------------------------------------------');
disp(coef_error);

disp('----------------------------------------------------------------');
disp('Error relativo en el  calculo de coeficientes en punto fijo: [%] ');
disp('----------------------------------------------------------------');
disp(coef_error_rel);
%}
disp('----------------------------------------------------------------');
disp('              Valores caracteristicos del error :');
disp('----------------------------------------------------------------');

fprintf('Error medio = %f \n', error_medio);
fprintf('Error maximo = %f \n', error_max);
fprintf('Error mínimo = %f \n', error_min);
%{
disp('----------------------------------------------------------------');
disp('            Valores caracteristicos del error relativo :');
disp('----------------------------------------------------------------');

fprintf('Error medio = %f \n', error_rel_medio);
fprintf('Error maximo = %f \n', error_rel_max);
%}

%% Grafico las señales:

%----------------- Grafico señal, espectro e histograma  ------------------

NF = 2;
NC = 1;

fig0 = figure();
titulo = ('Señal a analizar');
xlab = 't[s]';
ylab = 'h[t]';
mode = 0;
color = '-g';
subplot(NF, NC, 1); PlotTiempo(h, k, titulo, xlab, ylab, mode, color);
subplot(NF, NC, 2); PlotFFT(h, Fs, 'Señal a analizar FFT', 0, ylab);

%{
[barras rangos] = hist(coef_error); %,bins);
barras = barras(2 : size(barras, 2));
rangos = rangos(2 : size(rangos, 2));
subplot(NF, NC, 3);
bar(rangos, barras);
title('Histograma de los valores de error producidos por la convoluciÃ³n en Punto Fijo');
xlabel('Error');
ylabel('Frecuencia de error');
%}

%----------------- Grafico detalles ------------------

cantidad_escalas = length(a);                                              % calculo la cantidad de detalles

fig1 = figure();
NF = cantidad_escalas;
NC = 2;

nCoef = 0:(length(coef) - 1);

for i= 1:cantidad_escalas
    % fAsc = Frecuencia_Asociada_Escala(w, Fs, a(i));
    fAsc = scal2frq(a(i), 'morl', Fs);
    titulo = sprintf('CWT fa = %.2f Hz', fAsc);
    
        subplot(NF, NC, 2*i - 1); PlotTiempo(coef(i, :), nCoef, titulo, 'coef float', 'CWT float', mode, color);
        subplot(NF, NC, 2 *i); PlotTiempo(coef_fp.data(i, :), nCoef, titulo, 'coef int', 'CWT fp', mode, color);
end




% fig1 = figure();
% mesh(mycoef);
