// lab4_ex6- Matrix Convolution
clc;
clear;
close;

// Convolution using the Matrix method
x = [1; 2; -3; 2; 1];
h = [1 0 -1]; // row vector

Nx = length(x);
Nh = length(h);
Ny = Nx + Nh - 1;

// Create Toeplitz convolution matrix
H = zeros(Ny, Nx);

for i = 1:Ny
    for j = 1:Nx
        idx = i - j + 1;
        if (idx >= 1 & idx <= Nh) then
            H(i,j) = h(idx);
        end
    end
end

//Display x(n) and h(n)
disp("x(n) = ");
disp(x');
disp("h(n) = ");
disp(h);

// Display H
disp("Toeplitz convolution matrix H = ");
disp(H);

// Compute y(n)
y = H * x;
disp("y(n) = ");
disp(y'); // row vector

