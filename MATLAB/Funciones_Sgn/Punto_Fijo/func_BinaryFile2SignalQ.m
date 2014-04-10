%> \file func_BinaryFile2SignalQ.m
%> \brief 	Convierte de un archivo binario a una señal
%> \author Roux, Federico Gabriel (rouxfederico@gmail.com)
%> \author UTN FRBA - DSPRT
%> \date 25.06.2010
%> \version 1.0.0	
%> \note: TP#3: Funciones accesorias
%--------------------------------------------------------------------------

%> \brief lee una señal de largo N de un archivo binario, tipo de datos 
%> \brief float (single)
%> \param   FileName : Nombre del archivo
%>
%> \warning Para hacer correctamente la lectura de datos desde el VisualDSP++ hay que
%> \warning hacer el dump de memoria en un archivo de texto, tildando la opción de
%> \warning "Write format to file", para que importdata() pueda saber que el archivo
%> \warning está guardado en 1.15


function [signal] = func_BinaryFile2SignalQ(FileName , N)

datos = importdata(FileName);
signal = datos.data' ;  % Traspongo porque importdata devuelve estructura como columna
return ;

end