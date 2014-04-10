%-------------------------------------------------------------------------
%   C�tedra de Procesamiento Digital de Se�ales
%   Profesor : MSc.Ing. Franco Mart�n Pessana
%
%   Trabajo Pr�ctico #2 : DFT. Filtros de Fase Cero
%
%   Script del Ejercicio N�2 : 
%
%   2.Determine y grafique las parte real e imaginaria y  el espectro de 
%   magnitud y fase la Transformada de Fourier de una secuencia (TFS) para
%   diferentes valores de r y ?. 
%
%   G(e^jw) = 1/[1 - 2*r*cos(phi)*e^-jw + r^2*e^-2jw];
% 
%   Fecha de creaci�n   : 13-09-2010
%   �ltima Modificaci�n : 14-10-2010
%
%   Autor : Federico Roux (rouxfederico@gmail.com)
%   Departamento de Ingenieria Electr�nica
%   Facultad Regional Buenos Aires
%   Universidad Tecnol�gica Nacional
%-------------------------------------------------------------------------

%% Inicializaci�n del script

clc ;           % Limpio el Command Window
close all ;     % Cierro todas las ventanas
clear all ;     % Limpio variables del Workspace

addpath     ./imgOut ;    % directorio de almacenamiento de im�genes
addpath     ./fun ;       % directorio de almacenamiento de funciones

imagenesPath = './imgOut/' ;

%% Desarrollo te�rico : 
%
% La transferencia del enunciado puede ser escrita en transformada Z
% recordando que TFS = TZ siempre y cuando z = e^(jw). Si reemplazamos esto
% obtenemos lo siguiente :
%
%   G(z) = 1/[1 - 2*r*cos(phi)*z^-1 + r^2*z^-2];   
% 
% Trabajando con esta �ltima expresi�n, si la reescribimos en funci�n de
% potencias positivas de z nos queda :
%
%   G(z) = z^2/[z^2 - 2*r*cos(phi)*z + r^2 ];   
% 
% Los coeficientes de numerador y denominador quedan como sigue : 
%
%   denominador = [1 -2*r*cos(phi) r^2] ;
%   numerador   = [1 0 0] ;
% 
% Para tener una idea de lo que realiza esta transferencia conviene
% visualizarla en su diagrama de polos y ceros. Para calcular la ubicaci�n
% de los polos tenemos que resolver la ecuaci�n de 2do orden del
% denominador, con lo cual nos queda :
%
%   z1 = r*[cos(phi) + j*sin(phi) ] = r*e(j*phi) ;
%   z2 = r*[cos(phi) - j*sin(phi) ] = r*e(-j*phi) ;
%
% Y los ceros f�cilmente podemos ver que se encuentran los 2 en el origen.
% De esto podemos ver que al tener un par de polos complejos conjugados en
% un �ngulo 'phi' y un radio 'r', y los ceros en el origen. Podemos asignar
% algunos valores para realizar un gr�fico de polos y ceros, por ejemplo :

fs = 2*pi ;                            % Ts = 1s -> TFSA

% Filtro N�1 :

phi1 = pi/4 ;                       % Fase de los polos
r1 = 0.8 ;                          % Radio respecto al origen de los polos

A1 = [1 -2*r1*cos(phi1) r1^2] ;     % Coeficientes del denominador
B1 = [1 0 0] ;                      % Coeficientes del numerador

Hz1 = tf(B1, A1, fs, 'q') ;              % Genero la transferencia en TZ

img0 = figure() ;                   % Genero un handler para una figura
pzplot(Hz1) ;                       % Diagrama de polos y ceros en Plano Z
rotulo = sprintf('Filtro aguja phi = %.2f[rad] radio = %.2f', phi1, r1);
set(img0,'name',rotulo);


%saveas(img0, [imagenesPath 'Ej2_planoZ_f1.jpg']) ;   % Guardo imagen

% Si cambiamos los par�metros de la transferencia podemos ver como se
% modifica el diagrama de polos y ceros :

phi2 = (2*pi)/3 ;                   % Fase de los polos
r2 = 0.99 ;                         % Radio respecto al origen de los polos

A2 = [1 -2*r2*cos(phi2) r2^2] ;     % Coeficientes del denominador
B2 = [1 0 0] ;                      % Coeficientes del numerador

Hz2 = tf(B2, A2, fs, 'q') ;              % Genero la transferencia en TZ

img1 = figure() ;                   % Genero un handler para una figura
pzplot(Hz2) ;                       % Diagrama de polos y ceros en Plano Z
rotulo = sprintf('Filtro aguja phi = %.2f[rad] radio = %.2f', phi2, r2);
set(img1,'name',rotulo);

%saveas(img1, [imagenesPath 'Ej2_planoZ_f2.jpg']) ;   % Guardo imagen

% Podemos ver claramente que en ambos casos se tratar� de un filtro
% pasabanda, ya que en la frecuencia discreta representada por el �ngulo de
% los polos 'phi', el m�dulo de la transferencia se har� m�s grande, siendo
% su valor proporcional a la distancia entre los polos y el c�rculo de
% radio unidad '(1-r)'. Es decir, a medida que 'r' se hace m�s grande y se
% acerca a 1, el sobrepico de la transferencia del filtro se har� m�s
% grande. En el extremo, si r = 1 (lo cual est� negado en el enunciado, ya
% que se especifica  '0 < r < 1', la transferencia del filtro ser�a
% infinita para �sa frecuencia, transformandose en un oscilador. La
% restricci�n de 'r < 1' est� para asegurar la estabilidad del filtro.


%% Algoritmo del Script :

% Filtro pasabajos con fase no lineal

N = 256 ;

[h1 t1] = impz(B1, A1, N) ;
[h2 t2] = impz(B2, A2, N) ;

% Gr�fico de la se�al de salida

fs = 1 ;            % Ts = 1s -> TFSA
mode = '-r' ;       % Interpolo para que parezca una TFS

% Gr�ficos del primer filtro
[espectro img1] = PlotFFT( h1', fs, mode, 1 ) ;
[espectro img2] = PlotFFT( h1', fs, mode, 0 ) ;

rotulo = sprintf('Filtro aguja phi = %.2f[rad] radio = %.2f', phi1, r1);
set(img1,'name',rotulo);
set(img2,'name',rotulo);

% Gr�ficos del segundo filtro
[espectro img3] = PlotFFT( h2', fs, mode, 1 ) ;
[espectro img4] = PlotFFT( h2', fs, mode, 0 ) ;

rotulo = sprintf('Filtro aguja phi = %.2f[rad] radio = %.2f', phi2, r2);
set(img3,'name',rotulo);
set(img4,'name',rotulo);
