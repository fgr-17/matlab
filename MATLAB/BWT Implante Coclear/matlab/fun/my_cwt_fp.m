% -------------------------------------------------------------------------
%
%   Archivo:        my_cwt_fp.m
%
%   Descripciï¿½n:    version propia del algoritmo de CWT, haciendo la
%   convolucion de la señal con la integral de la wavelet desplazada y
%   escalada y luego diferenciando esta señal (con el metodo contrario
%   usado para integrar). VERSION EN PUNTO FIJO
%
% VER COMO CALCULAR LA RAIZ CUADRADA
%
%   Autor:          ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: Ing. BRUNO, JuliAn S.
%   Procesamiento Digital de SeÑales(PDS)
%   Departamento de Ing.ElectrOnica.
%   Facultad Buenos Aires
%   Universidad Tecnoligica Nacional
%
% -------------------------------------------------------------------------

function [y] = my_cwt_fp(x, escalas, wavelet)

WL = 16;                                                                    % WL de operandos
FL = 15;                                                                    % FL de operandos
ModoOverFlow = 'Saturate';                                                  % Modo de saturaciÃ³n de los operandos

T = numerictype(    'Signed', true, ...                                     % Definimos el tipo numerico 1.15, que es el tipo que usan los operandos de la ALU
                    'WordLength', WL, ...
                    'FractionLength', FL);

                                                                            
%{
T_escala = numerictype( 'Signed', true, ...                                 % Falta convertir la escala a FP
                        'WordLength', WL, ...
                        'FractionLength', 13);
%}                
                
F_MAC = fimath( 'ProductMode', 'SpecifyPrecision', ...                      % Definimos la aritmï¿½tica de la MAC
                'ProductWordLength', 32, ...
                'ProductFractionLength', 31, ...
                'SumMode', 'SpecifyPrecision', ...
                'SumWordLength', 40, ...
                'SumFractionLength', 31, ...
                'OverFlowMode', ModoOverFlow,...
                'RoundMode', 'floor');                


N = length(x);                                                              % Longitud de la señal
L = 1024;                                                                    % Longitud inicial de la ondita, sin decimar
li = -8;
ls =  8;
escalas_N = size(escalas, 2);                                               % Cantidad de escalas a evaluar

y = fi(zeros(escalas_N, N), T, F_MAC);

[w0 t] = wavelet(li, ls, L);                                                  % Genero la wavelet completa

dt = t(2) - t(1);                                                           % Calculo la Ts de la Wavelet
W = cumsum(w0)*dt;                                                          % Calculo la integral numerica por suma acumulativa

w0T = t(L) - t(1);                                                          % Soporte completo de la ondita

for i = 1:escalas_N
    
    a = escalas(i);                                                         % Guardo en 'a' la escala a procesar    
    
    exp2 = ceil(log2(a) + 0.1);                                             % Calculo el exponente de la potencia de 2 mayor mas 
                                                                            % cercana al maximo. Sumo uno para que escale por lo menos por 4
                                                                            % y se pueda hacer shift despues de la raiz cuadrada
    
    if(rem(exp2, 2) == 1)                                                   % Si el exponente a normalizar no es par,
        exp2 = exp2 + 1;                                                    % le sumo uno para que lo sea
    end
                                                                            
    % Chequear si la potencia a normalizar no supera la cantidad de bits de
    % resoluciÃ³n del sistema numÃ©rico
    
    norm2 = 2^exp2;                                                         % Tengo que normalizar las escalas con el maximo en potencia de dos   
        
    j = 0:(w0T * a);                                                        % Coeficientes a decimar
    j = j / (a * dt);                                                       % <--------- Ver como implementarla en FP
    j = 1 + floor(j);         
    
    Wsub = W(j);                                                            % Decimaciï¿½n de la wavelet
    
    Winv = fliplr(Wsub);                                                    % Invierto el orden de las muestras para luego hacer la resta   
    
    Yt = my_conv_fp(Winv, x); %, 16, 15);                                   % Hago la convolucion entre la señal y la integral de la wavelet
    %yt = diff(Yt.data);                                                    % Diferencio el array para quitar la integral de la wavelet
    
    yt = diff_fp(Yt);                                                       % Diferencio el array para obtener quitar la integral de la fï¿½rmula    
    yt_N = size(yt, 2);                                                     % Calculo el largo de la señal obtenida
    
%    a_esc = a / (norm2);                                                    % Normalizo con la potencia de dos mas proxima y mayor al maximo de escala
%    a_fp = fi(a_esc, T, F_MAC);                                             % Convierto a 1.15
    
    % y(i, :) = -sqrt(a)*wkeep1(yt, N);                                     % Me quedo con la parte central
    
    ini = ceil(yt_N/2 - N/2);                                               % LÃ­mite inferior de donde termina el transitorio de entrada
    fin = ceil(yt_N/2 - 1 + N/2);                                           % LÃ­mite superior donde empieza el transitorio de salida
    
%    y(i, :) = -sqrt(a_fp, T, F_MAC) * yt(ini:fin);                          % Multiplico por el coeficiente de la CWT
    y(i, :) = yt(ini:fin);
    % y(i, :) = bitshift(y(i, :), exp2 / 2);                                % A veces no funciona si multiplico en el mismo lugar
    % y(i, :) = yt(ini:fin);                                                % Recorto la parte que interesa, el resto es el transitorio
          
    % y = -sqrt(a_fp, T, F_MAC) * yt;
    % y = bitshift(y, 1);          
       
end
    
end 
 