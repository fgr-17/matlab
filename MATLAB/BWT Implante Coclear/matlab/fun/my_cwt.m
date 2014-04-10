% -------------------------------------------------------------------------
%
%   Archivo:        my_cwt.m
%
%   Descripciï¿½n:    versiï¿½n propia del algoritmo de CWT, haciendo la
%   convolucion de la seï¿½al con la integral de la wavelet desplazada y
%   escalada y luego diferenciando esta seï¿½al (con el mï¿½todo contrario
%   usado para integrar).
%
%   Autor:          ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: Ing. BRUNO, Juliï¿½n S.
%   Procesamiento Digital de Seï¿½ales(PDS)
%   Departamento de Ing.Electrï¿½nica.
%   Facultad Buenos Aires
%   Universidad Tecnolï¿½gica Nacional
%
% -------------------------------------------------------------------------

function [y] = my_cwt(x, escalas, wavelet)

N = length(x);                                                              % Longitud de la seï¿½al
L = 1024;                                                                   % Longitud inicial de la ondita, sin decimar
li = -8;                                                                    % Instante inicial del soporte
ls = 8;                                                                     % Instante final del soporte

escalas_N = size(escalas, 2);                                               % Cantidad de escalas a evaluar

y = zeros(escalas_N, N);                                                    % Inicializo el array con ceros

[w0 t] = wavelet(li, ls, L);                                                % Genero la wavelet completa

dt = t(2) - t(1);                                                           % Calculo la Ts de la Wavelet
W = cumsum(w0)*dt;                                                          % Calculo la integral numerica por suma acumulativa


w0T = t(L) - t(1);

%% ---------------------------------------------------

fprintf('\n\n\n\nFUNCION MY_CWT()\n');

%% ---------------------------------------------------


for i = 1:escalas_N
    
    a = escalas(i);                                                         % Guardo en 'a' la escala a procesar

%     j = 0:(w0T * a);                                                      % En escala 1 tengo 16+1 muestras. Puedo elegir desde 1/16 hasta 64
%     j = j / (a * dt);                                                     %                                        
%     j = 1 + floor(j);                                                     % Me queda un espacio menos entre la 1er y segunda muestra. Despues están equiespaciadas
 
    Wsub = Escalar_Wavelet(W, t, a);                                        % Decimacion de la wavelet   
    Winv = fliplr(Wsub);                                                    % Invierto el orden de las muestras para luego hacer la resta       
    Yt = myConv(Winv, x);                                                   % Hago la convolucion entre la señal y la integral de la wavelet
%    Yt = wconv1(Winv, x);
    yt = diff(Yt);                                                          % Diferencio el array para quitar la integral de la wavelet
        
    y(i, :) = -sqrt(a) * wkeep1(yt, N);                                     % Me quedo con la parte central    
    y(i, :) = wkeep1(yt, N);                                                % Me quedo con la parte central
       
end
    
end 
 