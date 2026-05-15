// ====================================================================
// LAB 7 - Exercise 7
// Linear convolution using FFT and zero-padding
// ====================================================================

clear;
clc;

// ===== Function =====
function y = linear_conv_fft(x, h)

    Nx = length(x);
    Nh = length(h);

    // Length of linear convolution
    Nfft = Nx + Nh - 1;

    // Zero-padding
    x_pad = [x zeros(1, Nfft - Nx)];
    h_pad = [h zeros(1, Nfft - Nh)];

    // FFT
    X = fft(x_pad);
    H = fft(h_pad);

    // Frequency-domain multiplication
    Y = X .* H;

    // IFFT
    y = real(ifft(Y));

endfunction


// ===== Example 1 =====
disp("===== Example 1 =====");

x = [1 2 3 4 5];
h = [1 -1 2];

y_fft  = linear_conv_fft(x, h);
y_conv = convol(x, h);

disp("x(n) = "), disp(x);
disp("h(n) = "), disp(h);

disp("Linear convolution using FFT:");
disp(y_fft);

disp("Using convol():");
disp(y_conv);

disp("Maximum error:");
disp(max(abs(y_fft - y_conv)));


// ===== Example 2 =====
disp("===== Random Signals =====");

rand("seed", getdate("s"));
x2 = rand(1,15);
h2 = rand(1,10);

y2_fft  = linear_conv_fft(x2, h2);
y2_conv = convol(x2, h2);

disp("Maximum error:");
disp(max(abs(y2_fft - y2_conv)));
