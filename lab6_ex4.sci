// ======================================
// LAB6_EX4 – Ve pho bien do va pho pha
// ======================================
clear; clc; close;

w = linspace(-%pi, %pi, 4000);   // tan so [-pi, pi]

// ---- Phan thuc va phan ao cua mau so ----
A_re = 1 + 0.1*cos(w) + 0.2*cos(2*w);   // phan thuc
A_im = -0.1*sin(w) - 0.2*sin(2*w);      // phan ao

// ---- Pho bien do ----
H_mag = 1 ./ sqrt(A_re.^2 + A_im.^2);

// ---- Pho pha (rad) ----
H_phase = -atan(A_im, A_re);             // rad

// ============================================================
// Ve hinh
// ============================================================
figure(1); clf();
gcf().figure_size = [900, 650];

// ---- Subplot 1: Pho bien do ----
subplot(2,1,1);
plot(w/%pi, H_mag, 'b-');
xgrid();
xlabel('F(Hz)');
ylabel('|H(e^{j\omega})|');
title('Pho bien do cua ham truyen H(e^{j*\omega})');
gca().x_location = 'origin';
xtick_pos = [-1, -0.5, 0, 0.5, 1];
gca().x_ticks = tlist(['ticks','locations','labels'], ...
    xtick_pos, ['-1','-0.5','0','0.5','1']);

// ---- Subplot 2: Pho pha ----
subplot(2,1,2);
plot(w/%pi, H_phase * 180/%pi, 'r-');
xgrid();
xlabel('F(Hz)');
ylabel('Pha(do)');
title('Pho pha cua ham truyen H(e^{j*\omega})');
gca().x_location = 'origin';
gca().x_ticks = tlist(['ticks','locations','labels'], ...
    xtick_pos, ['-1','-0.5','0','0.5','1']);
