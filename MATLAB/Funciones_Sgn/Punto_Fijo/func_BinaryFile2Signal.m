%**************************************************************************
% 
%
%	UTN - FRBA
%	Procesamiento Digital de Se�ales en Tiempo Real (RT-DSP)
%	A�o: 2010
%
%	Ing. Juli�n S. Bruno
%	Ing. Jer�nimo F. Atencio
%	Lucio J. Martinez Garbino
%
%
%	Programas de ejemplo Matlab y VisualDSP++
%	File: func_BinaryFile2Signal
%	Version: 1.0
%	Descripcion: lee una se�al de largo N de un archivo binario, tipo de
%   datos float (single)
%	Autor: Martinez Garbino, Lucio Jos�
%   Fecha: 19-05-2010
%	Compilado con: Matlab R2007a
%
%**************************************************************************
function [signal] = func_BinaryFile2Signal(FileName , N)

    fid = fopen(FileName, 'r+b');

    % signal = fread(fid,[1 N],'single'); % leo como vector fila
    % signal = fread(fid,[1 N],'*int16', 0, 'l'); % leo como vector fila
    signal = fread(fid,[1 N],'uint16=>single', 0, 'l'); % leo como vector fila
    %signal = fread(fid, N ,'single');  % leo como vector columna
    
   
    fclose(fid);

    return ;
end