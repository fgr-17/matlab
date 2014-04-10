%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Archivo: my_Blackman_Win.m
%
%   function my_Blackman_Win
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


function [signal] = my_Blackman_Win(x)

xN = size(x, 2);                                                                                % Mido el largo de la cadena de entrada
n = 0 : (xN - 1);                                                                               % Array de n�mero de muestras 

w =  0.42 - 0.5*cos((2*pi*n)/(xN - 1)) - 0.08*cos((4*pi*n)/(xN - 1));                     % Array con las muestras de la ventana de Hanning

signal = x .* w;                                                                                % Se�al con la ventana aplicada

end