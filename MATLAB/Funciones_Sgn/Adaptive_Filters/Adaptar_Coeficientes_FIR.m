%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo : Adaptar_Coeficientes_FIR.m
%
%   Función:
%       function [Wk yk ek] = Adaptar_Coeficientes_FIR(xk, dk, orden, mu);
%   
%   Parámetros de Entrada:
%   - xk:       Señal de entrada
%   - dk:       Señal deseada a adaptar
%   - orden:    Orden del filtro adaptativo FIR 
%   - mu:       Velocidad de convergencia del algoritmo
%
%   Parámetros de salida:
%   - Wk:       Pesos asignados 
%   - yk:       Señal de Salida
%   - ek:       Señal de Error 
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%   
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Señales(PDS)
%   Departamento de Ing.Electrónica.
%   Facultad Buenos Aires
%   Universidad Tecnológica Nacional
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Wk yk ek] = Adaptar_Coeficientes_FIR(xk, dk, orden, mu)

coef_N = orden + 1;         % Cantidad de coeficientes del filtro

xN = size(xk, 2);           % Mido el largo de la señal
dN = size(dk, 2);           % Mido el largo de la señal a adaptar

% Elijo el menor de los largos para los arrays ek y yk:
if(xN > dN)
    eN = dN;
    yN = dN;
    N  = dN;
else
    eN = xN;
    yN = xN;
    N  = dN;    
end  

Wk = zeros(1, coef_N);       % Vector Inicial de Pesos

yk = zeros(1, yN);          % Señal de salida inicial del FIR
ek = zeros(1, eN);          % Señal inicial de error

for i = coef_N : N
    
    xk_i = fliplr(xk(1, (i - coef_N + 1):i));   % Sub-array de las muestras actuales
    
    yk(i) = xk_i * Wk';                     % Calculo la salida del filtro
    ek(i) = dk(i) - yk(i);                  % Calculo el error cometido
    
    Wk = Wk + 2*mu*ek(i)*xk_i;              % Recalculo los Wk por LMS
end

end
