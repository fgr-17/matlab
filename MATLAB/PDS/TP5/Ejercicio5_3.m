%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo:    Ejercicio5_3.m
%
%   Enunciado:  Repita el ejercicio anterior si ahora la se�al de entrada 
%   x(t) es Ruido Blanco Gaussiano con media cero y desv�o est�ndar 2. 
%   �Qu� conclusiones puede sacar al respecto?. Incremente el valor de ? y 
%   observe que sucede con el error en la muestra k-�sima del filtro IIR 
%   adaptativo dise�ado, es decir e[k].
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
Ts = 1/fs;                  % Per�odo de muestreo           [s]

fc = 60;                    % Frecuencia de corte del filtro[Hz]
wc = 2*pi*fc;               % Pulsaci�n de corte            [rad/s]

xN = 1000;                  % Cantidad de muestras de la se�al de entrada

des_std_1 = 10;              % Desv�o est�ndar del ruido gaussiano

x = wgn(1, xN, des_std_1, 'linear');        % Genero el ruido blanco

t = 0 : (xN - 1);           % Eje de muestras
t = t/fs;                   % Eje temporal

%% Resoluci�n del ejercicio:
%
% Lo primero que hago es hallar la se�al deseada d[n], a la que el filtro
% tiene que adaptar la se�al x(t). Esta se�al d[n] es la que sale de
% filtrar la versi�n discreta de la se�al x(t) con el filtro. La expresi�n
% del filtro, en su transformada de Laplace es:
%
%           2.pi.fc 
%   H(s) = -----------
%          s + 2.pi.fc
%
% Ordenando los coeficientes en un array me queda:
%{
N = [0  2*pi*fc];           % Coeficientes del numerador
D = [1  2*pi*fc];           % Coeficientes del denominador

[B A] = bilinear(N, D, fs); % Transformada bilinear para hallar H(z) a fs
%}

% Transformada Z de un filtro RC anal�gico:
B = [wc wc] / (2*fs + wc);
A = [1  (-2*fs + wc)/(2*fs + wc)];

% La se�al deseada es la se�al de entrada filtrada por el bloque anterior:
d = filter(B, A, x);

% Una vez que tengo la se�al de entrada y la deseada, elijo el orden del
% filtro y la velocidad de convergencia, y hago el procesamiento LMS:
x_fft = fft(x);
x_pot = sum(abs(x_fft).^2) ^ (0.5);

orden = 1;
% mu = 100/(20 * (orden + 1) * x_pot);
mu = 0.001;

[Bk Ak yk ek] = Adaptar_Coeficientes_IIR(x, d, orden, mu);

fc_m = (2*fs*Bk(1)) / (2*pi*(1 - Bk(1)));

%% Devuelvo los resultados del algoritmo por consola

disp('Los coeficientes del numerador son:');
linea1 = sprintf( '%d\n', Bk);
disp(linea1);

disp('Los coeficientes del denominador son:');
linea2 = sprintf( '%d\n', Ak);
disp(linea2);

disp('La frecuencia de corte del filtro adaptado es:');
linea3 = sprintf( '%.2f[Hz]\n', fc_m);
disp(linea3);


%% Gr�fico las se�ales de trabajo

fig1 = figure();    % Obtengo el handler de la figura
rotulo = sprintf('Filtro Adaptativo mu = %f. fs = %dkHz sd = %d. Identificaci�n de un filtro RC con ruido blanco', mu, fs/1000, des_std_1);
set(fig1,'name',rotulo);


NF = 4;             % Cantidad de filas del gr�fico
NC = 2;             % Cantidad de columnas del gr�fico

subplot(NF, NC, 1);
PlotTiempo(x, t, 'Se�al de entrada x[n]', 't', 'x[n]', 0, 'g');
subplot(NF, NC, 2);
PlotFFT(x, fs, 'Espectro de la se�al de entrada X[k]', 1, 'f[Hz]');

subplot(NF, NC, 3);
PlotTiempo(d, t, 'Se�al deseada d[n]', 't', 'd[n]', 0, 'g');
subplot(NF, NC, 4);
PlotFFT(d, fs, 'Espectro de la se�al de deseada D[k]', 1, 'f[Hz]');

subplot(NF, NC, 5);
PlotTiempo(yk, t, 'Se�al filtrada y[n]', 't', 'y[n]', 0, 'g');
subplot(NF, NC, 6);
PlotFFT(yk, fs, 'Espectro de la se�al filtrada Y[k]', 1, 'f[Hz]');

subplot(NF, NC, [7 8]);
PlotTiempo(ek, t, 'Se�al de error e[n]', 't', 'e[n]',0, 'g');

%% Conclusiones: 
%  -------------
%
%   Al hacer la adaptaci�n del filtro con ruido blanco en lugar de un par
%   de se�ales senoidales, el filtro adaptado es mucho m�s similar al
%   original, porque le estoy aportando m�s informaci�n sobre el sistema.
%   En el espectro en frecuencia de las se�ales esto puede verse
%   claramente, el filtro se copia mucho mejor con la entrada de ruido
%   blanco porque lo excito con muchas componentes en frecuencia y veo la
%   respuesta a todas esas excitaciones. 
%   Por otro lado, al aumentar el desv�o estandar del ruido blanco, lo que
%   estoy haciendo es aumentar la energ�a de la se�al, y con esto logro que
%   el sistema se adapte m�s r�pido, siempre y cuando no cambie el valor
%   del "mu". 
