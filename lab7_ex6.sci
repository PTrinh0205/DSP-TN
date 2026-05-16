// Khoi tao moi truong
clear; clc;

// FFT method
function y = circ_conv_fft(x, h)
    N = max(length(x), length(h));
    X = fft(x, -1);
    H = fft(h, -1);
    Y = X .* H;
    y = real(fft(Y, 1));
endfunction

// Direct method
function y = circ_conv_direct(x, h)
    N = max(length(x), length(h));
    y = zeros(1, N);

    x_pad = [x, zeros(1, N - length(x))];
    h_pad = [h, zeros(1, N - length(h))];

    for n = 1:N
        sum_val = 0;
        for m = 1:N
            idx = pmodulo(n - m, N) + 1;
            sum_val = sum_val + x_pad(m) * h_pad(idx);
        end
        y(n) = sum_val;
    end
endfunction

// =======================
// Verification
// =======================
x = [1, 2, 3, 4];
h = [1, 1, 1, 1];

y_fft = circ_conv_fft(x, h);
y_direct = circ_conv_direct(x, h);

disp("FFT result:"), disp(y_fft);
disp("Direct result:"), disp(y_direct);

difference = max(abs(y_fft - y_direct));
mprintf("\nMax difference: %e\n", difference);

if difference < 1e-12 then
    disp("SUCCESS");
else
    disp("FAILURE");
end
