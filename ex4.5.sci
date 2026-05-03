clear;
clf();

// 1. Khoi tao cac tham so
N = 8;                  // Chu ky tuan hoan chung
n = 0:N-1;              // Chi so mien thoi gian
k = 0:N-1;              // Chi so mien tan so

// 2. Tao tin hieu x(n) trong mot chu ky
x = 2 + 2*cos(%pi*n/4) + cos(%pi*n/2) + 0.5*cos(3*%pi*n/4);

// 3. Tinh cac he so Fourier ck bang FFT
// ck = (1/N) * DFT(x)
ck = fft(x, -1) / N;
ck = clean(ck);         // Loai bo sai so so hoc nho (e-16)

// 4. Tinh Pho mat do cong suat Sxx(k) = |ck|^2
Sxx = abs(ck).^2;

// =================================================================
// (a) VE PHO MAT DO CONG SUAT
// =================================================================
plot2d3(k, Sxx, 2);
plot(k, Sxx, '.b');
xtitle("Power Density Spectrum S_{xx}(k) = |c_k|^2", "k (Harmonic index)", "Power");
xgrid();
