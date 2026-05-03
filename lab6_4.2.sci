// ============================================================
// LAB6_BAI 4.2 – Ve pho bien do va pho pha
// ============================================================
clear; clc;

A = 1; a = 1;
F = linspace(-5, 5, 2000);
 
// ---- (a) xa(t) = A*exp(-a*t)*u(t) ----
Xa_a_mag   = A ./ sqrt(a^2 + (2*%pi*F).^2);
Xa_a_phase = -atan(2*%pi*F / a) * 180/%pi;   // doi sang do
 
figure(1); clf();
subplot(2,1,1);
  plot(F, Xa_a_mag, 'b-');
  xgrid(); xlabel('F (Hz)'); ylabel('|Xa(F)|');
  title('4.2(a) Pho bien do – xa(t)=A*exp(-a*t)*u(t)');
  gca().x_location = 'origin';
subplot(2,1,2);
  plot(F, Xa_a_phase, 'r-');
  xgrid(); xlabel('F (Hz)'); ylabel('Pha (do)');
  title('4.2(a) Pho pha – angle = -atan(2*pi*F/a)');
  gca().x_location = 'origin';
 
// ---- (b) xa(t) = A*exp(-a*|t|) ----
Xa_b_mag   = 2*a*A ./ (a^2 + (2*%pi*F).^2);
Xa_b_phase = zeros(1, length(F));            // pha = 0
 
figure(2); clf();
subplot(2,1,1);
  plot(F, Xa_b_mag, 'b-');
  xgrid(); xlabel('F (Hz)'); ylabel('|Xa(F)|');
  title('4.2(b) Pho bien do – xa(t)=A*exp(-a*|t|)');
  gca().x_location = 'origin';
subplot(2,1,2);
  plot(F, Xa_b_phase, 'r-');
  xgrid(); xlabel('F (Hz)'); ylabel('Pha (do)');
  title('4.2(b) Pho pha = 0 (tin hieu chan, pho thuc duong)');
  gca().x_location = 'origin';
