clear;
clf();

// 1. Khoi tao tin hieu trong mot chu ky N = 6
x_cycle = [3, 2, 1, 0, 1, 2]; 
N = length(x_cycle);
n = 0:N-1;

// 2. Tinh toan he so Fourier ck bang cong thuc DFS
// ck = (1/N) * DFT(x)
ck = fft(x_cycle, -1) / N;

// Lam sach du lieu (loai bo cac gia tri cuc nho e-16 do sai so lam tron)
ck = clean(ck);

k = 0:N-1;
magnitude = abs(ck); // Pho bien do
phase = atan(imag(ck), real(ck)); // Pho pha

// =================================================================
// (a) VE TIN HIEU VA PHO
// =================================================================
scf(0);

// --- Ve tin hieu x(n) ---
subplot(3,1,1);
n_plot = -6:11; // Ve 3 chu ky de quan sat tinh tuan hoan
x_plot = [x_cycle, x_cycle, x_cycle];
plot2d3(n_plot, x_plot);
plot(n_plot, x_plot,'.b');
xtitle("Signal x(n) (Periodic with N=6)", "n", "Amplitude");
xgrid();

// --- Ve Pho Bien Do |ck| ---
subplot(3,1,2);
plot2d3(k, magnitude);
plot(k, magnitude, '.b');
poly2 = gce(); poly2.children.mark_style = 0;
xtitle("Magnitude Spectrum |ck|", "k", "Magnitude");
xgrid();

// --- Ve Pho Pha arg(ck) ---
subplot(3,1,3);
plot2d3(k, phase);
plot(k, phase, '.b');
gca().data_bounds = [0, -1; N-1, 1];
xtitle("Phase Spectrum arg(ck)", "k", "Phase (rad)");
xgrid();
