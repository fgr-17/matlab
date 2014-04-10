%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo: Transformada_Gabor.m
%
%   function Transformada_Gabor
%
%   Par�metros:     x  :    Se�al temporal a analizar
%                   a  :    Compresi�n de la ventana de Gabor
%                   N  :    Cantidad de puntos a analizar
%                   f0 :    Frecuencia de Modulaci�n de la ventana
%                   Fs :    Frecuencia de muestreo de la se�al
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Se�ales(PDS)
%   Departamento de Ing.Electr�nica.
%   Facultad Buenos Aires
%   Universidad Tecnol�gica Nacional
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [y t] = Transformada_Gabor(x, a, N, f0, Fs)

L = size(x, 2);                                                     % Largo de la se�al a analizar
                                                    
t0 = zeros(1, N);

ti = 0;                                                             % Tiempo de inicio de an�lisis
tf = (L - 1)/Fs;                                                    % Tiempo de fin de an�lisis

dt = (tf - ti) / N;                                                 % Intervalos entre an�lisis

t0 = 0:(N - 1);                                                     % Inicializo array de desplazamiento
t0 = t0 * dt;                                                       % Escalo array a dt

fmod = mySin(1, f0, 0, L, Fs);                                      % Se�al modulante

y = zeros(N, L);                                                    % Inicializo matriz de resultados

for i = 1:N

    [W t]= my_Gabor_Win(a, t0(i), L, Fs);                           % Calculo los puntos de la ventana de Gabor
    Wmod = W .* fmod;                                               % Ventana modulada
    
    y(i, :) = filter(Wmod, 1, x);                                   % Guardo la se�al filtrada    
    % y(i, :) = Wmod .* x;                                          % Guardo la se�al filtrada    
end

end