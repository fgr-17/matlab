% Ejercicio Nro. 2b) de la Guía_6 de IPSI
% Filtro Pasa Altos FIR con Ventana Hanning
% FIR con su respuesta de frecuencia y fase. Diseño mediante ventana cuadrada
% Copyright @2002
% Ing. Franco Martín Pessana. Universidad Favaloro

function G6_2b
% Filtro pasa altos FIR wc=0.75*pi
fs=10000;
figure(1)
N=63;			% tamaño del filtro FIR
fc=(3000+3500)/2;        % Frecuencia de Corte
alfa=(N-1)/2;	% Linealidad de fase
wc=2*pi*fc/fs;  % Angulo de corte
n=0:N-1;
hn=zeros(size(n));
hn=zeros(size(n));
expo=(-1).^n;
hn=(pi-wc)/pi*sinc((pi-wc)*(n-alfa)/pi).*expo;
Wn=hanning(N)';
hn=hn.*Wn;
subplot(221)
plot(n,hn);
title('Pasa Altos. h[n]')
grid on
[H,W]=freqz(hn,1,N);
f=W*fs/(2*pi);
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
title('Resp. de Fase')
grid on
xlabel('f [Hz]')