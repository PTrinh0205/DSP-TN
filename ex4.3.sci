clear;
clf;

tau = 2; // Do rong xung tam giac
F = -3:0.01:3;

// Tinh X(F) theo dung cong thuc cuoi cua bai giai
XF = tau * (sinc(F * tau)).^2; 

clf();
subplot(2,1,1);
plot(F, XF, 'b'); // Pho bien do (luon duong)
xtitle("|X(F)|- Magnitude spectra", "F", "Amplitude");

subplot(2,1,2);
plot(F, atan(imag(XF), real(XF)), 'r'); // Pho pha (bang 0)
gca().data_bounds = [min(F), -1; max(F), 1];
xtitle("Phase X(F) - Phase spectra", "F", "Phase (rad)");
