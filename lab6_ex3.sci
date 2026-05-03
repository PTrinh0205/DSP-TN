// ======================================
// LAB6_EX3 – Ve pho bien do va pho pha
// ======================================

// Exercise 3a: x1(n) = (0.1)^n u(n)
clear; clc;
 
n = 0:100;
x1 = (0.1).^n;
Nfft = 512;
X1 = fft([x1, zeros(1, Nfft-length(x1))]);
X1 = [X1(Nfft/2+2:Nfft), X1(1:Nfft/2+1)];
omega = linspace(-%pi, %pi, Nfft);
 
scf(1); clf();
subplot(2,1,1);
plot(omega/%pi, abs(X1));
xlabel('Tan so chuan hoa (\omega/\pi)');
ylabel('|X_1(e^{j\omega})|');
title('Pho bien do cua x_1(n) = (0.1)^n u(n)');
xgrid();
 
subplot(2,1,2);
plot(omega/%pi, phasemag(X1,'c')*%pi/180);
xlabel('Tan so chuan hoa (\omega/\pi)');
ylabel('\angle X_1 (rad)');
title('Pho pha cua x_1(n) = (0.1)^n u(n)');
xgrid();

// Exercise 3b: x2(n) = delta(n)+delta(n-1)+delta(n-2)+delta(n-3)
clear; clc;
 
x2 = [1, 1, 1, 1];
Nfft = 512;
X2 = fft([x2, zeros(1, Nfft-length(x2))]);
X2 = [X2(Nfft/2+2:Nfft), X2(1:Nfft/2+1)];
omega = linspace(-%pi, %pi, Nfft);
 
scf(2); clf();
subplot(2,1,1);
plot(omega/%pi, abs(X2));
xlabel('Tan so chuan hoa (\omega/\pi)');
ylabel('|X_2(e^{j\omega})|');
title('Pho bien do cua x_2(n)');
xgrid();
 
subplot(2,1,2);
plot(omega/%pi, phasemag(X2,'c')*%pi/180);
xlabel('Tan so chuan hoa (\omega/\pi)');
ylabel('\angle X_2 (rad)');
title('Pho pha cua x_2(n)');
xgrid();
