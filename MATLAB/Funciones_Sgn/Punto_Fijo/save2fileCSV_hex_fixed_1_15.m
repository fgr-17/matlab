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
%   Programas de ejemplo Matlab y VisualDSP++
%	File: save2fileCSV_hex_fixed_1_15.m
%	Version: 1.0
%	Descripcion: Producto punto de vectores para comparar con VisualDSP++
%	en punto fijo simulando la arquitectura
%	Autor: Martinez Garbino, Lucio Jos�
%   Fecha: 10-05-2010
%	Compilado con: Matlab R2007a
%
%**************************************************************************
function save2fileCSV_hex_fixed_1_15(file_name, senal)

    % si debe tomar la se�al en float y guardarla en punto fijo debe ir esta
    % linea, para 1.15
    senal=fi(senal,1,16, 0);

    N= length(senal);

    str=[];
    for i=1: N
        str =[str ; hex(senal(i))];
    end

    last  = str(N,:);                       % guardo el ultimo numero
    str = str(1:(N-1),:);                   % borro de la senal el ultimo numero
    fid = fopen(file_name,'wt');            % creo el archivo

    for i=1: (N-1)
        fprintf(fid,'0x%s,\n',str(i,:));    % escribo todos los numeros menos el ultimo (,)
    end

    fprintf(fid,'0x%s',last);               % escribo el ultimo numero (sin coma)
    fclose(fid);                      

    return ;
end
