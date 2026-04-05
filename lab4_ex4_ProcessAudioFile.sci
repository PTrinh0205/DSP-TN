//lab4_ex4
clc;
clear;
close;

// =======================
// 1. Signal parameters
// =======================
fs = 8000;              // Sampling frequency (Hz)
t = 0:1/fs:2;           // Time vector (2 seconds)

// =======================
// 2. Generate audio signal
// =======================
// 440 Hz sine wave (A note)
x1 = sin(2 * %pi * 440 * t);

// 880 Hz sine wave (higher harmonic)
x2 = 0.5 * sin(2 * %pi * 880 * t);

// Combine signals
x = x1 + x2;

// =======================
// 3. Play original signal
// =======================
playsnd(x, fs);

// =======================
// 4. Plot time-domain signal
// =======================
figure(1);
plot(t, x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Audio Signal');

// =======================
// 5. Frequency spectrum (FFT)
// =======================
X = fft(x);
f = (0:length(X)-1)*(fs/length(X));

figure(2);
plot(f, abs(X));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum');

// =======================
// 6. Add Gaussian noise
// =======================
noise = 0.2 * rand(1, length(x), 'normal');
x_noise = x + noise;

// Play noisy signal
playsnd(x_noise, fs);

// =======================
// 7. Reduce volume
// =======================
x_low = 0.3 * x;
playsnd(x_low, fs);

// =======================
// 8. Save audio files
// =======================
wavwrite(x, fs, 'clean_signal.wav');
wavwrite(x_noise, fs, 'noisy_signal.wav');

// =======================
// 9. Compare signals
// =======================
figure(3);
plot(t, x, 'b');
plot(t, x_noise, 'r');
legend('Original', 'Noisy');
title('Signal Comparison');
