% -------------------------------------------------------------------------
%
%   Archivo:        test_wavelet_Morlet_Munich.m
%
%   Descripción:    prueba 
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

function [BW f0] = BW_Munich(banda)

[f0 finf fsup] = Bandas_ERB(banda);

BW = (25 + (75*1.4*f0.^2)).^(0.69);   

    
end