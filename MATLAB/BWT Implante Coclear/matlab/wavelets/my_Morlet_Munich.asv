% -------------------------------------------------------------------------
%
%   Archivo:        my_cwt.m
%
%   Descripción:    versión propia del algoritmo de CWT
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Señales(PDS)
%   Departamento de Ing.Electrónica.
%   Facultad Buenos Aires
%   Universidad Tecnológica Nacional
%
% -------------------------------------------------------------------------

function [W t] = my_Morlet_Munich(a, b, N, Fs)

if(nargin < 4)                                                              % Si no ingresó la Fs
    Fs = 16000;                                                             % la pongo por default en 16kHz como el paper
end

t = 0:(N - 1);                                                              % Eje de muestras
t = t - b;                                                                  % Eje de tiempo desplazado
t = t/a;


[BW f0] = BW_Munich(1);
% f0N = f0/Fs;

W = ((pi/1.4)^(1/2))*BW*exp(-((BW*pi*t/Fs).^2)/(1.4))*exp(-1i*2*pi*f0);      % Wavelet Morlet modificada

W = (1/a^(1/2)).*W;

sum_W = sum(W);
W = W / sum_W;
W = abs(W);

end


