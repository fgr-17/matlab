% -------------------------------------------------------------------------
%
%   Archivo:        test_wavelet_Morlet_Munich.m
%
%   Descripci�n:    prueba 
%
%   Autor: ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: PESSANA, Franco
%   Procesamiento Digital de Se�ales(PDS)
%   Departamento de Ing.Electr�nica.
%   Facultad Buenos Aires
%   Universidad Tecnol�gica Nacional
%
% -------------------------------------------------------------------------

function [BW f0] = BW_Munich(banda)

[f0 finf fsup] = Bandas_ERB(banda);

BW = (25 + (75*1.4*f0.^2)).^(0.69);   

    
end