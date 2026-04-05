clc;
clear;

x = [1 2 -3 2 1];
h = [1 0 -1 -1 1];
N = length(x);
M = length(h);

//Folding and shifting method
y = zeros(1, N);

for n = 0:N-1
    for k = 0:M-1
        index = modulo(n - k + N, N) + 1;
        y(n+1) = y(n+1) + h(k+1) * x(index);
    end
end

disp("y(n) = ");
disp(y);

//Draw x(n), y(n) and energy of discrete signals
n = 0:N-1;
Ex = sum(x.^2);
Ey = sum(y.^2);

// Display energy values to console for verification
printf("Total Energy of x(n) (Ex) = %f\n", Ex);
printf("Total Energy of y(n) (Ey) = %f\n", Ey);

clf();

// --- Subplot 1: Input Signal x(n) ---
subplot(3,1,1);
plot2d3(n, x);
p1 = plot(n, x, 'b.'); 
gca().auto_scale = "on";
xtitle("Input Signal x(n)", "Sample index (n)", "Amplitude");

// --- Subplot 2: Output Signal y(n) ---
subplot(3,1,2);
plot2d3(n, y);
p2 = plot(n, y, 'r.');  
gca().auto_scale = "on";
xtitle("Output Signal y(n) (Circular Convolution)", "Sample index (n)", "Amplitude");

// --- Subplot 3: Total Energy Comparison (Bar Chart) ---
subplot(3,1,3);
bar([1 2], [Ex Ey], 0.5); // Bar chart comparing total energy values
xtitle("Total Energy Comparison", "Signal", "Energy Value");
