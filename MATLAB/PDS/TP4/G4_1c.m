% Ejercicio Nro. 1c) de la Guía_6 de IPSI
% Filtro Pasa Banda FIR con Ventana Rectangular
% FIR con su respuesta de frecuencia y fase. Diseño mediante ventana cuadrada
% Copyright @2002
% Ing. Franco Martín Pessana. Universidad Favaloro

% Ver de la página 25 de la carpeta. Copiar de las fórmulas de filtros
% ideales.

function G6_1c
% Filtro FIR Pasa Banda f1=1 KHz y f2=2 KHz
fs=8000;
figure(1)
N=67;			% tamaño del filtro FIR
fc1=1000;       % Frecuencia de corte inferior
fc2=2000;       % Frecuencia de corte superior
alfa=(N-1)/2;	% Linealidad de fase
w1=2*pi*fc1/fs;
w2=2*pi*fc2/fs;
n=0:N-1;
hn=zeros(size(n));
% hn=zeros(size(n));
hn=w2/pi*sinc(w2*(n-alfa)/pi)-w1/pi*sinc(w1*(n-alfa)/pi);
subplot(221)
plot(n,hn);
title('Pasa Banda. H[n]')
grid on
[H,W]=freqz(hn,1,N);
f=W*fs/(2*pi);			% Escala de Frecuencia en Hz.
subplot(222)
plot(f,abs(H));
grid on
title('Resp. de Amplitud')
subplot(223)
Hdb=20*log(abs(H));
plot(f,Hdb);
grid on
title('Resp. de Amplitud (dB)')
xlabel('f [Hz]')
subplot(224)
plot(f,angle(H));
grid on
title('Resp. de Fase')
grid on
xlabel('f [Hz]')