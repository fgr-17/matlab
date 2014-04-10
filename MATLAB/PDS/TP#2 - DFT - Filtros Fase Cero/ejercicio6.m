% -------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #2 : DFT. Filtros de Fase Cero
%
%   Script del Ejercicio N�6 : 
%
%   6. SUBMUESTREO. Considerando la se�al anal�gica xa(t)= exp(-a*t).u(t), 
%   y utilizando un valor de a, un TS y una cantidad de muestras N, de 
%   manera tal que la se�al digitalizada pueda ser considerada de Banda 
%   Limitada, se pide: Observe la composici�n espectral de la se�al 
%   digitalizada  x[n] = x(n*Ts ), utilizando el comando MatLab  fft, que 
%   realiza la Transformada Discreta de Fourier de una se�al discreta. 
%   Recuerde que la Transformada tiene parte real e imaginaria, por lo que 
%   deber� calcular el m�dulo de la misma con el comando abs, para luego    
%   realizar el graficado de la misma, con los comandos plot o stem. 
% 
% 
%   Fecha de creaci�n   : 19-01-2011
%   �ltima Modificaci�n : 19-01-2011
%
%   Autor : ROUX, Federico (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
% -------------------------------------------------------------------------

%% Inicializaci�n del script
%  ------------------------------------------------------------------------
clc ;                       % Limpio el Command Window
close all ;                 % Cierro todas las ventanas
clear all ;                 % Limpio variables del Workspace

addpath     ./imgOut ;      % Directorio de almacenamiento de im�genes
addpath     ./fun ;         % Directorio de almacenamiento de funciones
addpath     ./sgnIn ;       

imagenesPath = './imgOut/' ;
signalsPath  = './sgnIn/' ;

%% Muestreo de la se�al :
%  ------------------------------------------------------------------------

% Para muestrear correctamente la se�al x(t) es necesario tener en cuenta
% su espectro en frecuencia. Para ello calculamos lo siguiente :
% La se�al x(t) = e^(-a*t)*u(t) tiene su transformada de Laplace igual a :
%
%                                             2a
%    x(t) = e^(-a*t)*u(t)  <---->  X(s) = ---------
%                                         a^2 - s^2
%
% El espectro en frecuencia cont�nua de la se�al viene dado por la
% transformada de Fourier de la misma, que puede obtenerse como un caso
% particular de la transformada de Laplace para sigma = 0. Aplicando
% m�dulo, nos queda lo siguiente:
%
%             2 * a
%   X(jw) = ----------
%            a^2 + w^2
%
% Para muestrearla correctamente podemos calcular la frecuencia para la
% cual cae 3dB su contenido arm�nico, y luego tomar como la frecuencia de
% Nyquist una d�cada por encima de dicha frecuencia, para finalmente
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
% Despejando fc de esta �ltima f�rmula, queda que :
%
%                (2^(1/2)-1)^(1/2)
%       fc = a   -----------------
%                     2*pi
%
% Luego, relacionando �ste valor con la frecuencia de muestreo, nos queda
% que : 
%
%   fs = 20 * fc


%% C�lculo de par�metros de muestreo y muestreo de la se�al:
%  ------------------------------------------------------------------------
a   = 1 ;       % Coeficiente de atenuaci�n de la exponencial
t0  = -100 ;       % Instante inicial de la funci�n 
A   = 1 ;       % Constante de amplificaci�n de la se�al
N   = 64 ;     % Cantidad de muestras a tomar

fc = (a * ( 2^ ( 1/ 2) - 1) ^( 1/ 2) ) / (2 *pi) ;

fn = 10*fc ;      % Frecuencia de Nyquist 
fs = 2 *fn ;        % Frecuencia de Muestreo

[sgn t_sgn] = myExp (A, t0, a, N, fs) ;

%% Gr�fico de la se�al y su espectro:
%  ------------------------------------------------------------------------

NF = 2;
NC = 1;

subplot(NF, NC, 1);
PlotTiempo(sgn, t_sgn, 'Se�al Original', 'n', 'x[k]', 0, '.g');

modo  = '.r' ;      % Par�metro del gr�fico
polar = 2 ;         % Grafica m�dulo y fase

subplot(NF, NC, 2);
[sgn_espectro fig0] = PlotFFT(sgn, fs, modo, polar) ;

saveas(fig0, [imagenesPath 'SubMuestreo_Se�al_Original.jpg']) ;   % Guardo imagen

%% Guardo la se�al en un archivo:
%  ------------------------------------------------------------------------

archivo_nom = 'sgn_myExp.mat' ;
path_sgn = sprintf ( '%s%s', signalsPath, archivo_nom) ;

save (path_sgn, 'sgn', 'fs') ;

fig = gcf();
set(fig, 'Name', 'Gr�fico temporal y frecuencial de una exponencial' );


