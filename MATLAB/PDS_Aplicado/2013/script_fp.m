%% SeÃ±ales

x = [0.1333333 0.10127 0.5 0.125];

WordLength = 16;
FractLength = 15;
ModoOverFlow = 'saturate';

%% Quantize
%{
q = quantizer( 'Mode', 'fixed',...
              'Format' ,[WordLength FractLength],...
              'OverflowMode', ModoOverFlow,...
              'RoundMode','floor'...
            );
       
       
x_q = quantize(q, x);  % SeÃ±al cuantizada
%}


%% Fi objects

T = numerictype(    'Signed', true, ...
                    'WordLength', WordLength, ...
                    'FractionLength', FractLength);

               

T_MAC = numerictype('Signed', true, ...
                    'WordLength', 40, ...
                    'FractionLength', 31);

F_MAC = fimath( 'ProductMode','SpecifyPrecision', ...
            'ProductWordLength',32, ...
            'ProductFractionLength',31, ...
            'SumMode','SpecifyPrecision', ...
            'SumWordLength',40, ...
            'SumFractionLength',31, ...
            'OverFlowMode',ModoOverFlow,...
            'RoundMode','floor');

Acum    = fi( 0 , T_MAC , F_MAC );


%% Genero las señales:

N = 16;
L = 128;
A = 0.8;
duty = 50;
fs = 1000;

f0 = 100;


[s1 t1] = Cuadrada(L, A, N, duty, fs);
[s2 t2] = mySin(0.6, f0, 0, L, fs);

subplot(3, 1, 1);
plot(t1, s1);
subplot(3, 1, 2);
plot(t2, s2);

%% PAso las señales a pto. fijo

s1_fp = fi(s1, T, F_MAC);
s2_fp = fi(s2, T, F_MAC);

y_fp = s1_fp .* s2_fp;

subplot(3, 1, 3);
plot(t, y_fp.data);




