% -------------------------------------------------------------------------
%   Cátedra de Procesamiento Digital de Señales
%   Profesor : MSc.Ing. Franco Martín Pessana
%
%   Trabajo Práctico #2 : DFT. Filtros de Fase Cero
%
%   Script del Ejercicio N°6 : 
%
%   6. SUBMUESTREO. Considerando la señal analógica xa(t)= exp(-a*t).u(t), 
%   y utilizando un valor de a, un TS y una cantidad de muestras N, de 
%   manera tal que la señal digitalizada pueda ser considerada de Banda 
%   Limitada, se pide: Observe la composición espectral de la señal 
%   digitalizada  x[n] = x(n*Ts ), utilizando el comando MatLab  fft, que 
%   realiza la Transformada Discreta de Fourier de una señal discreta. 
%   Recuerde que la Transformada tiene parte real e imaginaria, por lo que 
%   deberá calcular el módulo de la misma con el comando abs, para luego    
%   realizar el graficado de la misma, con los comandos plot o stem. 
% 
% 
%   Fecha de creación   : 19-01-2011
%   Última Modificación : 19-01-2011
%
%   Autor : ROUX, Federico (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electrónica
%   Facultad Regional Buenos Aires
%   Universidad Tecnológica Nacional
% -------------------------------------------------------------------------

%% Inicialización del script
%  ------------------------------------------------------------------------
clc ;                       % Limpio el Command Window
close all ;                 % Cierro todas las ventanas
clear all ;                 % Limpio variables del Workspace

addpath     ./imgOut ;      % Directorio de almacenamiento de imágenes
addpath     ./fun ;         % Directorio de almacenamiento de funciones
addpath     ./sgnIn ;       

imagenesPath = './imgOut/' ;
signalsPath  = './sgnIn/' ;

%% Muestreo de la señal :
%  ------------------------------------------------------------------------

% Para muestrear correctamente la señal x(t) es necesario tener en cuenta
% su espectro en frecuencia. Para ello calculamos lo siguiente :
% La señal x(t) = e^(-a*t)*u(t) tiene su transformada de Laplace igual a :
%
%                                             2a
%    x(t) = e^(-a*t)*u(t)  <---->  X(s) = ---------
%                                         a^2 - s^2
%
% El espectro en frecuencia contínua de la señal viene dado por la
% transformada de Fourier de la misma, que puede obtenerse como un caso
% particular de la transformada de Laplace para sigma = 0. Aplicando
% módulo, nos queda lo siguiente:
%
%             2 * a
%   X(jw) = ----------
%            a^2 + w^2
%
% Para muestrearla correctamente podemos calcular la frecuencia para la
% cual cae 3dB su contenido armónico, y luego tomar como la frecuencia de
% Nyquist una década por encima de dicha frecuencia, para finalmente
% muestrear al doble de la frecuencia de Nyquist, es decir :
%
%       fs = 2 * fn
%
%       fn = 10 * fc
%
% Para calcular la frecuencia de corte, calculamos primero el valor de la
% transferencia en w = 0, y luego calculamos el valor para el cual cae 3dB
% : 
%
%   X(jw)|      = 2 / a
%        |w=0
%
% En la frecuencia de corte tendremos :
%
%               |X(j0)|                     2 * a
%   X(j*wc) = ----------- = 2^(1/2) / a = ---------
%               2^(1/2)                   a^2 + wc^2  
%
% Despejando fc de esta última fórmula, queda que :
%
%                (2^(1/2)-1)^(1/2)
%       fc = a   -----------------
%                     2*pi
%
% Luego, relacionando éste valor con la frecuencia de muestreo, nos queda
% que : 
%
%   fs = 20 * fc


%% Cálculo de parámetros de muestreo y muestreo de la señal:
%  ------------------------------------------------------------------------
a   = 1 ;       % Coeficiente de atenuación de la exponencial
t0  = -100 ;       % Instante inicial de la función 
A   = 1 ;       % Constante de amplificación de la señal
N   = 64 ;     % Cantidad de muestras a tomar

fc = (a * ( 2^ ( 1/ 2) - 1) ^( 1/ 2) ) / (2 *pi) ;

fn = 10*fc ;      % Frecuencia de Nyquist 
fs = 2 *fn ;        % Frecuencia de Muestreo

[sgn t_sgn] = myExp (A, t0, a, N, fs) ;

%% Gráfico de la señal y su espectro:
%  ------------------------------------------------------------------------

NF = 2;
NC = 1;

subplot(NF, NC, 1);
PlotTiempo(sgn, t_sgn, 'Señal Original', 'n', 'x[k]', 0, '.g');

modo  = '.r' ;      % Parámetro del gráfico
polar = 2 ;         % Grafica módulo y fase

subplot(NF, NC, 2);
[sgn_espectro fig0] = PlotFFT(sgn, fs, modo, polar) ;

saveas(fig0, [imagenesPath 'SubMuestreo_Señal_Original.jpg']) ;   % Guardo imagen

%% Guardo la señal en un archivo:
%  ------------------------------------------------------------------------

archivo_nom = 'sgn_myExp.mat' ;
path_sgn = sprintf ( '%s%s', signalsPath, archivo_nom) ;

save (path_sgn, 'sgn', 'fs') ;

fig = gcf();
set(fig, 'Name', 'Gráfico temporal y frecuencial de una exponencial' );


