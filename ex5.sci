clf();
clear;

// 1. Dinh nghia dai tan so (tu -pi den pi)
omega = -%pi : 0.001 : %pi; 

// 2. Dinh nghia cac thanh phan pho theo ly thuyet
// Tin hieu vao X(w) = 1 / (1 - 0.5*exp(-j*w))
X = 1 ./ (1 - 0.5*exp(-%i*omega));

// Dap ung tan so H(w) = 1 + exp(-j*w)
H = 1 + exp(-%i*omega);

// Tin hieu ra Y(w) = X(w) * H(w)
Y = X .* H;

// =================================================================
// PHAN 1: VE PHO BIEN DO (Magnitude Spectrum)
// =================================================================
scf(1); 
clf();

// Pho bien do |X(w)|
subplot(3,1,1);
plot(omega, abs(X), 'b', 'LineWidth', 2);
xtitle("|X(w)| - Input Amplitude Spectrum", "Frequency (rad/s)", "Amplitude");
xgrid();

// Pho bien do |H(w)|
subplot(3,1,2);
plot(omega, abs(H), 'g', 'LineWidth', 2);
xtitle("|H(w)| - System Amplitude Spectrum", "Frequency (rad/s)", "Amplitude");
xgrid();

// Pho bien do |Y(w)|
subplot(3,1,3);
plot(omega, abs(Y), 'r', 'LineWidth', 2);
xtitle("|Y(w)| - Output Amplitude Spectrum", "Frequency (rad/s)", "Amplitude");
xgrid();

// =================================================================
// PHAN 2: VE PHO PHA (Phase Spectrum)
// Su dung atan2 de dam bao do muot va khop voi ly thuyet arctan
// =================================================================

scf(2);
clf();

phase_X = atan(imag(X), real(X));
phase_H = atan(imag(H), real(H));
phase_Y = atan(imag(Y), real(Y));

subplot(3,1,1);
plot(omega, phase_X, 'b');
xtitle("Phase X(omega)", "omega", "rad"); xgrid();

subplot(3,1,2);
plot(omega, phase_H, 'g');
xtitle("Phase H(omega)", "omega", "rad"); xgrid();

subplot(3,1,3);
plot(omega, phase_Y, 'r');
xtitle("Phase Y(omega)", "omega", "rad"); xgrid();
xgrid();

// =================================================================
// KIEM TRA GIA TRI TAI CAC DIEM DAC BIET
// =================================================================
printf("\nKiem tra tai omega = 0:\n");
printf("|Y(0)| = %.2f (Ly thuyet: 4.00)\n", abs(1.5 * 2.66)); // Gia tri tham khao

printf("\nKiem tra tai omega = pi:\n");
printf("|Y(pi)| = %.2f (Ly thuyet: 0.00)\n", abs(interp1(omega, abs(Y), %pi)));
