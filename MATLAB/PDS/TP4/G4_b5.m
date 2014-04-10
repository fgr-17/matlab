% [Y]=g6_b4()
% Ejercicio 5 de la guía 6. segunda parte. Filtro pasa Bajos Chevyshev

function G6_b5()

[N,Wn]=CHEB1ORD(2*pi*500,2*pi*1000,1,45,'s')	% Orden y Frecuencia Natural de Diseño
[B,A]=CHEBY1(N,1,Wn,'s');
H=tf(B,A)
figure(1)
bode(H)
Fs=10000;						% Frecuencia de Muestreo
[Numz,Denz]=bilinear(B,A,Fs);		% Transformada Bilineal para obtener IIR
[Hd,W]=freqz(Numz,Denz);
figure(2)
F=Fs*W./(2*pi);
subplot(211)
plot(F(1:150),abs(Hd(1:150)));
xlabel('Hz')
ylabel('Hd')
HHd=tf(Numz,Denz,1/Fs)				% Filtro Butterworth de 6to orden digital
Z=roots(Numz);
P=roots(Denz);
subplot(212)
zplane(Z,P)