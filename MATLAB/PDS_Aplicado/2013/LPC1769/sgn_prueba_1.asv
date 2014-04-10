%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%   Archivo : sgn_prueba_1.m
%
%   Descripcion: Genero señales de prueba, las guardo en formato Q15 en un
%   dos archivos ".h" separados, para poder incluirlas desde la IDE del
%   microcontrolador.
%
%   Autor: Roux, Federico G. (froux@favaloro.edu.ar)
%
%   Laboratorio de Microprocesadores
%   FICEN Universidad Favaloro, 2013
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% Par�metros en com�n : 

clc;
clear all;
close all;


fs = 1000 ;                                                                 % Frecuencia de sampleo de la se�al

FileName_Signal = 'Sgn_Sin.h' ;                                             % Nombre del archivo de la se�al
FileName_Kernel = 'Krn_Sin.h' ;                                             % Nombre del archivo del kernel

NF = 2 ;        % Cantidad de filas del gr�fico
NC = 1 ;        % Cantidad de columnas del gr�fico
fig0 = figure();

%% Síntesis de la se�al :

                                                                            % Genero la se�al u[k]:
A   = 0.8 ;                                                                 % Amplitud de la se�al
f0  = 100 ;                                                                 % Frecuencia fundamental 1kHz
ph0 = 0.4 ;                                                                 % Fase cero
xN  = 300 ;                                                                 % Cantidad de muestras de la se�al


[sgn t_sgn] = mySin(A, f0, ph0, xN, fs);                                    % Genero una se�al senoidal

                                                                            % Guardo la se�al en un archivo

FilePath = '.\\' ;                                                          % Path donde voy a guardar la se�al

PathSignal = sprintf('%s%s', FilePath, FileName_Signal);

save2fileCSV_hex_fixed_1_15(PathSignal,sgn);
                                                                            
subplot(NF,NC,1);                                                           % Plot de la señal
PlotTiempo(sgn, t_sgn,FileName_Signal,'u[k]','n',1, '.g');                  % Grafico la se�al


%% Síntesis del kernel :

                                                                            % Genero la se�al h[k] : 
A_k     = 0.001 ;                                                           % Amplitud de la se�al
f0_k    = 200 ;                                                             % Frecuencia fundamental 1kHz
ph0_k   = pi/2;                                                             % Fase cero
kN      = 300 ;                                                             % Cantidad de muestras de la se�al


[kernel t_sgn] = mySin(A_k, f0_k, ph0_k, kN, fs);                           % Genero una se�al senoidal

                                                                            % Guardo la se�al en un archivo
FilePath = '.\\' ;                                                          % Path donde voy a guardar la se�al

PathKernel = sprintf('%s%s', FilePath, FileName_Kernel);

save2fileCSV_hex_fixed_1_15(PathKernel,kernel);

                                                                            
subplot(NF,NC,2);                                                           % Plot de la señal
PlotTiempo(kernel, t_sgn,FileName_Kernel,'h[k]','n',1, '.b');               % Grafico la señal


%% Genero el sistema numérico del LPC1769

wlen = 16;                                                                  % Especifico el wordlength de los operandos
flen = 15;                                                                  % Especifico el fraclength de los operandos
sign = 1;                                                                   % Especifico el formato signado de los operandos

wlen_prod = 32;                                                             % Especifico el wordlength del producto
flen_prod = 30;                                                             % Especifico el fraclength del producto

wlen_acc = 64;                                                              % Especifico el wordlength del acumulador
flen_acc = 31;                                                              % Especifico el fraclength del acumulador    

modoOverFlow = 'saturate';
modoRound = 'round';

T = numerictype(    'Signed',           true, ...
                    'WordLength',       wlen, ...
                    'FractionLength',   flen);             

T_MAC = numerictype('Signed',           true, ...
                    'WordLength',       wlen_acc, ...
                    'FractionLength',   flen_acc);

F_MAC = fimath( 'ProductMode',          'SpecifyPrecision', ...
                'ProductWordLength',    wlen_prod, ...
                'ProductFractionLength',flen_prod, ...
                'SumMode',              'SpecifyPrecision', ...
                'SumWordLength',        wlen_acc, ...
                'SumFractionLength',    flen_acc, ...
                'OverFlowMode',         modoOverFlow,...
                'RoundMode',            modoRound);


%% Convierto señales al sistema numérico del LPC

sgn_q = fi(sgn, T, F_MAC);                                                  % Convierto la señal a punto fijo
kernel_q = fi(kernel, T, F_MAC);                                            % Convierto el kernel a punto fijo

mult_q15 = sgn_q .* kernel_q;                                               % Hago la multiplicación de los dos arrays


%% Hago el procesamiento en punto fijo sobre las señales sintetizadas

%% Levanto de la memoria del LPC1769 las señales y comparo:

mult_q15_arm = func_BinaryFile2Signal('./PDS_Aplicado/LPC1769/arm_mult_q15.bin',300);
mult_q15_arm_esc = mult_q15_arm / (2^flen_prod);

mult_err = abs(mult_q15.data - mult_q15_arm_esc);
mult_err_med = mean(mult_err);
mult_err_acc = sum(mult_err);






