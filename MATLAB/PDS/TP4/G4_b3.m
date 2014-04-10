% [Y]=g6_b3()
% Ejercicio 3 de la guía. Filtro Notch de 50 Hz. Se muestrea con Fs 1000 Hz y se pide
% el filtro digital correspondiente mediante Transfformada Bilineal

function G6_b3()

s=tf('s');
f0=50;						% Frecuencia de Eliminación
Fs=1000;						% Frecuencia de Muestreo
w0=2*pi*f0;					% Frecuencia angular de muestreo
Q0=100;						% Factor de Selectividad Elegido
Num=[1 0 w0^2];			% Numerador del Filtro Notch
Den=[1 w0/Q0 w0^2];		% Denominador del Filtro Notch
H=tf(Num,Den)				% Filtro Notch Analógico de 50 Hz
figure(1)
bode(H);
zoom on
[Numz,Denz]=bilinear(Num,Den,Fs);
[Hd,W]=freqz(Numz,Denz);
figure(2)
F=Fs*W./(2*pi);
subplot(211)
plot(F,abs(Hd));
xlabel('Hz')
ylabel('Hd')
HHd=tf(Numz,Denz,1/Fs)				% Filtro Notch Analógico de 50 Hz
Z=roots(Numz);
P=roots(Denz);
subplot(212)
zplane(Z,P)