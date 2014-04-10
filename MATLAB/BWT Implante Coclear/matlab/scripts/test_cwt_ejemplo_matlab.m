%% ------------------------------------------------------------------------
%
%   Archivo : test_cwt_ejemplo_matlab.m
%
%   Descripción : Genero una señal de 3 tramos con diferentes frecuencias
%   en cada uno y las extraigo después con una wavelet.
%
%   Autor : Federico Roux (rouxfederico@gmail.com) - Ej. de Matlab
%
%   RT-DSP.UTN.BA 2013
%
%
% ------------------------------------------------------------------------

%%

close all;
clear all;

% Set wavelet name,interval and number of samples.
wname  = 'morl';
A = 0; B = 64; P = 500;

%%

% Compute the sampling period and the sampled function, and the true frequencies.
t = linspace(A,B,P);
delta = (B-A)/(P-1);
% delta = (B-A)/(P);
tab_OMEGA = [5,2,1];
tab_FREQ  = tab_OMEGA/(2*pi);
tab_COEFS = [5,3,2];

% x = zeros(1,P);                                                             % Inicializo señal con ceros

P1 = 200;                                                                   % Cantidad de muestras de la primer freq
P2 = 200;                                                                   % Cantidad de muestras de la 2do freq
P3 = 100;                                                                   % Cantidad de muestras de la 3er freq

t1 = t(1:P1);                                                               % Primer array de tiempo
t2 = t(P1+1:P1+1+P2);                                                       % 2do array de tiempo
t3 = t(P1+P2+2:500);                                                        % 3er array de tiempo

x1 = sin(tab_OMEGA(1)*t1);
x2 = sin(tab_OMEGA(2)*t2);
x3 = sin(tab_OMEGA(3)*t3);

x = [x1 x2 x3];                                                             % Compongo las 3 partes de la señal

%{
for k = 1:3;
    x = x+tab_COEFS(k)*sin(tab_OMEGA(k)*t);
end
%}

% Set scales and use scal2frq to compute the array
% of pseudo-frequencies.
scales = 1:1:60;
tab_PF = scal2frq(scales,wname,delta);

% Compute the nearest pseudo-frequencies
% and the corresponding scales.
PF_app = zeros(1, 3);
SC_app = zeros(1, 3);

for k=1:3
  [dummy,ind] = min(abs(tab_PF-tab_FREQ(k)));
  PF_app(k) = tab_PF(ind);
  SC_app(k) = scales(ind);
end

%%

% Continuous analysis and plot. 
str1 = char( ...
   '500 samples of x = 5*sin(5t)+3*sin(2t)+2*sin(t) on [0,64]',...
   ['True frequencies (in Hz): [5 2 1]/(2*pi) =~ [' ...
   num2str(tab_FREQ,3) ']' ]  ...
   );
str2 = 'Array of pseudo-frequencies and scales: ';
str3 = num2str([tab_PF',scales'],3);
str4 = ['Pseudo-frequencies   = ' num2str(PF_app,3)];
str5 = ['Corresponding scales = ' num2str(SC_app,3)];
fig0 = figure; 

% coef = cwt(x,scales,wname,'plot'); 
coef = my_cwt(x,scales, @my_Morlet);

%% 

wL = 1024;
[w tw]= my_Morlet(1, (wL / 2) - 0.5, wL);                                   % Creo la wavelet afuera de las funciones de análisis

ax = gca; colorbar
axTITL = get(ax,'title');
axXLAB = get(ax,'xlabel');
set(axTITL,'String',str1)
set(axXLAB,'String',char(str4, str5))
clc; disp(char(' ',str1,' ',str2,str3,' ',str4,str5))     

fig1 = figure();                                                            % Me creo una nueva figura

NF = 4;
NC = 2;

subplot(NF, NC, 1);
PlotTiempo(x, t, 'Señal a analizar', 't', 'x[t]', 0, '-b');
subplot(NF, NC, 2);
PlotFFT(x, delta, 'Espectro Señal a analizar', 0, 'X(f)');

subplot(NF, NC, [3 4]);                                                           % Grafico la primer escala
f1cal = 0.792*2*pi;         
f1 = Frecuencia_Asociada_Escala(w, delta, 8);
% Calculo la frecuencia a partir del w calculado de la escala
PlotTiempo(coef(8, :), 1:500, sprintf('Escala 8 : f = %.2fHz', f1), 'k', 'CWT(8, :)[k]', 0, '-g');      % Grafico la escala 8

subplot(NF, NC, [5 6]);                                               
f2cal = 0.317*2*pi;
f2 = Frecuencia_Asociada_Escala(w, delta, 20);
PlotTiempo(coef(20, :), 1:500, sprintf('Escala 20 : f = %.2fHz', f2), 'k', 'CWT(20, :)[k]', 0, '.g');   % Grafico la escala 20

subplot(NF, NC, [7 8]);
f3cal = 0.158*2*pi;
f3 = Frecuencia_Asociada_Escala(w, delta, 40);
PlotTiempo(coef(40, :), 1:500, sprintf('Escala 40 : f = %.2fHz', f3), 'k', 'CWT(40, :)[k]', 0, '.g');   % Grafico la escala 40


