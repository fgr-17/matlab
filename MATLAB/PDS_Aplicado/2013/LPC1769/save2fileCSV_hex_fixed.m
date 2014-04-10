%**************************************************************************
% 
%
%	Universidad Favaloro
%	Procesamiento Digital de Se�ales en Tiempo Real (RT-DSP)
%	A�o: 2010
%
%	Federico G. Roux (froux@favaloro.edu.ar)
%
%
%   Programas de ejemplo Matlab y VisualDSP++
%	File: save2fileCSV_hex_fixed_1_15.m
%	Version: 1.0
%	Descripcion: Producto punto de vectores para comparar con VisualDSP++
%	en punto fijo simulando la arquitectura
%	Autor: Martinez Garbino, Lucio Jos
%   Fechsave2fileCSV_hex_fixed.ma: 10-05-2010
%	Compilado con: Matlab R2007a
%
%**************************************************************************

function save2fileCSV_hex_fixed(file_name, senal, WL, FL, signo)

    % si debe tomar la se�al en float y guardarla en punto fijo debe ir esta
    % linea, para 1.15
    senal=fi(senal,0,WL, FL);

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