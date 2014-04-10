% -------------------------------------------------------------------------
%
%   Archivo:        myConvDSP.m
%
%   Descripci�n:    Convoluci�n de dos Se�ales en punto Fijo
%
%   Par�metros:     h :Se�al a convolucionar.
%                   x: Se�al a convolucionar.
%                   WordLength : Cantidad de bits del ADC simulado
%                   FractLength : Cantidad de bits de parte fraccionaria
%
%   Devuelve:       y_fp: Vector con la se�al generada en punto fijo.
%                   yN: Cantidad de muestras de signal.
%
%   Autor:          ROUX, Federico G. (rouxfederico@gmail.com)
%
%   Profesor: Ing. BRUNO, Juli�n S.
%   RT-DSP, Departamento de Ing.Electr�nica.
%   05/2010 UTN-BA
% -------------------------------------------------------------------------

function [y_fp yN] = my_conv_fp(h, x) %, WordLength, FractLength)

%{
if(length(x) < length(h))                                                   % La señal h[k] siempre la tomo como la más corta
    sgn_aux = x;
    x = h;
    h = sgn_aux;
end
%}

%ModoOverFlow='Wrap';                                                       % Modo de saturaci�n Wrap-around
ModoOverFlow='Saturate';                                                    % Modo de saturaci�n "Saturate"

WordLength = 16;                                                            % Wordlength de los operandos
FractLength = 15;                                                           % Fractlength de los operandos

wLen_Prod = 32;                                                             % WL del producto
fLen_Prod = 31;                                                             % FL del producto

wLen_Acc = 40;                                                              % WL del acumulador
fLen_Acc = 31;                                                              % FL del acumulador

hN = size(h, 2);                                                            % Calculo el largo de h
xN = size(x, 2);                                                            % Calculo el largo de x

yN = hN + xN - 1;                                                           % Cantidad final de muestras del array de salida
%yN = xN - hN;                                                           % Descarto las muestras de inicialización y final
y = zeros(1, yN);                                                           % Inicializo con cero muestras

bloque_z = zeros(1, hN -     1);                                                % Genero un vector de ceros a agregar a la se�al
x_conv(1, :) = [bloque_z x bloque_z];                                       % Agrego ceros para multiplicar por cero hasta la entrada completa de h[n] en x[n]

%% Definición y cuantificación en el sistema numérico del DSP BF533:

%{
q = quantizer( 'Mode', 'fixed',...                                          % Creo un objeto cuantizador 1.15
               'Format', [WordLength FractLength],...
               'OverflowMode', ModoOverFlow,... 
               'RoundMode', 'floor');                                                         
                                                                            % Cuantifico las se�ales a 1.15(el tipo de datos que usa sigue siendo double)
x_q = quantize(q, x_conv);                                                  % Se�al cuantizada 
h_q = quantize(q, h);                                                       % Kernel cuantizado
y_q = quantize(q, y);                                                       % Salida cuantizada->son todos ceros a esta altura
%}

% Definimos el tipo numerico 1.15, que es el tipo que usan los operandos de la ALU
T = numerictype(    'Signed', true, ...
                    'WordLength', WordLength, ...
                    'FractionLength', FractLength);

%{
% Definimos el tipo numerico 9.31, que es el tipo en el que se acumulan los datos
T_MAC = numerictype('Signed', true, ...
                    'WordLength', wLen_Acc, ...
                    'FractionLength', fLen_Acc);
%}
                    
% Definimos la aritm�tica de la MAC
F_MAC = fimath( 'ProductMode', 'SpecifyPrecision', ...
                'ProductWordLength', wLen_Prod, ...
                'ProductFractionLength', fLen_Prod, ...
                'SumMode', 'SpecifyPrecision', ...
                'SumWordLength', wLen_Acc, ...
                'SumFractionLength', fLen_Acc, ...
                'OverFlowMode', ModoOverFlow,...
                'RoundMode', 'floor');

% ---------------
% Inicialización de la variable para guardar el producto y el acc, son necesarias?????
% ---------------
% producto_fp = fi( 0 , T , F_MAC);                                         % Genero la variable para almacenar el producto    
% Acum     = fi(0 , T_MAC , F_MAC );                                        % Genero el acumulador principal
     
        
% A partir de las señales, convierto las mismas a fp
x_fp = fi(x_conv, T, F_MAC );                                                    % Señal en punto fijo
h_fp = fi(h, T, F_MAC );                                                    % Kernel en punto fijo
y_fp = fi(y, T, F_MAC );                                                    % Salida en punto fijo


%% Algoritmo de convolución en Punto Fijo        
    
for i = 1:yN
    
    % y_fp(i) = 0;                                                            % inicializo el elemento i
    
    Acum = 0;                                                               % Inicializo el acumulador en cero
    
    for j = 1:hN
                                
        ind_h = hN - (j - 1);                                               % indice de la se�al que convoluciona: cuenta hacia atr�s igual en todas las iteraciones.
        ind_x = i + (j - 1);                                                % indice de la se�al a convolucinar: cuenta hacia adelante desplazada (i-1) veces
        
        % fprintf('ind_h = %d /// ind_x = %d /// i = %d /// j = %d \n', ind_h, ind_x, i, j);
        
        producto_fp = h_fp(ind_h) * x_fp(ind_x);                            % Producto
        Acum = Acum + producto_fp;                                          % Guardo en el acumulador
    
    end
    
    y_fp(i) = Acum;                                                         % Guardo el resultado en la se�al de salida
end


end