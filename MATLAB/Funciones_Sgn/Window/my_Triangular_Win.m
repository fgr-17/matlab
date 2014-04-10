%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo: my_Triangular_Win.m
%
%   function my_Triangular_Win
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


function [signal] = my_Triangular_Win(x)

xN = size(x, 2);                                                                                % Mido el largo de la cadena de entrada
n = 0 : (xN - 1);                                                                               % Array de n�mero de muestras 
    
if xN == 1                                                                                      % Si se hace el vivo con una muestra sola

    signal = 1;                                                                                 % La ventana es un uno
    return;                                                                                     % Retorno
    
elseif(mod(xN, 2) == 0)                                                                         % Pregunto si el n�mero de muestras es par    

    w(1:(xN + 1)/2) = (2/xN) * (1:(xN + 1)/2);                                        % Mitad ascendente de la ventana
    w((xN + 2)/2: xN) = (2*(xN + 1)/xN) - (2/xN)*((xN + 2)/2:xN);                       % Mitad descendente de la ventana

else                                                                                            % Si la cantidad de muestras es impar   

    w(1:((xN + 1)/ 2)) = (2/(xN + 1)) * (1 :((xN + 1)/2));                                      % Mitad ascendente de la ventana
    w((xN + 3)/2: xN) = (2*(xN + 1)/(xN + 1)) * -(2/(xN + 1))*((xN + 1)/2:xN);                   % Mitad descendente de la ventana
   
end 

signal = x .* w;                                                                                % Se�al con la ventana aplicada

end