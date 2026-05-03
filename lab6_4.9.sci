// ============================================================
// LAB6_BAI 4.9 – Ve pho bien do va pho pha: phan (a), (f), (g)
// ============================================================
clear; clc;
 
w = linspace(-%pi, %pi, 4000);   // tan so [-pi, pi]
 
// -----------------------------------------------------------
// (a): x(n) = u(n) - u(n-6)  =>  x(n)=1 voi n=0..5
//   X(e^jw) = sum_{n=0}^{5} e^{-jwn}
//           = e^{-j5w/2} * sin(3w)/sin(w/2)
// -----------------------------------------------------------
Xa = zeros(1, length(w));
for n = 0:5
    Xa = Xa + exp(-sqrt(-1)*w*n);
end
Xa_mag   = abs(Xa);
Xa_phase = atan(imag(Xa), real(Xa)) * 180/%pi;
 
figure(1); clf();
subplot(2,1,1);
  plot(w/%pi, Xa_mag, 'b-');
  xgrid();
  xlabel('\omega/\pi');
  ylabel('|X(e^{j\omega})|');
  title('4.9(a) Pho bien do: x(n)=u(n)-u(n-6)');
  gca().x_location = 'origin';
subplot(2,1,2);
  plot(w/%pi, Xa_phase, 'r-');
  xgrid();
  xlabel('\omega/\pi');
  ylabel('Pha (do)');
  title('4.9(a) Pho pha');
  gca().x_location = 'origin';
 
// -----------------------------------------------------------
// (f): x(n) = 2 - (1/2)^n,  |n| <= 4,  else 0
//   Tinh truc tiep tu dinh nghia DTFT
// -----------------------------------------------------------
n_f = -4:4;
x_f = 2 - (0.5).^n_f;
 
Xf = zeros(1, length(w));
for k = 1:length(n_f)
    Xf = Xf + x_f(k) * exp(-sqrt(-1)*w*n_f(k));
end
Xf_mag   = abs(Xf);
Xf_phase = atan(imag(Xf), real(Xf)) * 180/%pi;
 
figure(2); clf();
subplot(2,1,1);
  plot(w/%pi, Xf_mag, 'b-');
  xgrid();
  xlabel('\omega/\pi');
  ylabel('|X(e^{j\omega})|');
  title('4.9(f) Pho bien do: x(n)=2-(1/2)^n,  |n|<=4');
  gca().x_location = 'origin';
subplot(2,1,2);
  plot(w/%pi, Xf_phase, 'r-');
  xgrid();
  xlabel('\omega/\pi');
  ylabel('Pha (do)');
  title('4.9(f) Pho pha');
  gca().x_location = 'origin';
 
// -----------------------------------------------------------
// (g): x(n) = {-2,-1,0,1,2},  n = -2..2
//   X(e^jw) = -2j*(sin(w) + 2*sin(2w))
//   |X| = 2*|sin(w) + 2*sin(2w)|
//   phase = -pi/2 hoac +pi/2
// -----------------------------------------------------------
n_g = -2:2;
x_g = [-2, -1, 0, 1, 2];
 
Xg = zeros(1, length(w));
for k = 1:length(n_g)
    Xg = Xg + x_g(k) * exp(-sqrt(-1)*w*n_g(k));
end
Xg_mag   = abs(Xg);
Xg_phase = atan(imag(Xg), real(Xg)) * 180/%pi;
 
figure(3); clf();
subplot(2,1,1);
  plot(w/%pi, Xg_mag, 'b-');
  xgrid();
  xlabel('\omega/\pi');
  ylabel('|X(e^{j\omega})|');
  title('4.9(g) Pho bien do: x(n)={-2,-1,0,1,2}');
  gca().x_location = 'origin';
subplot(2,1,2);
  plot(w/%pi, Xg_phase, 'r-');
  xgrid();
  xlabel('\omega/\pi');
  ylabel('Pha (do)');
  title(['4.9(g) Pho pha = +-90 do ' ...
         '(tin hieu le, pho thuan ao)']);
  gca().x_location = 'origin';
