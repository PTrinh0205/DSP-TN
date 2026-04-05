// lab4_ex6- Enery
clc;
clear;
close;

// Input signals
x = [1 2 -3 2 1];   // signal x(n)
h = [1 0 -1];       // impulse response h(n)

// Compute linear convolution
y = conv(x,h);      // y(n) = x(n) * h(n)

// Compute signal energy
Ex = sum(x.^2);     // Energy of x(n)
Ey = sum(y.^2);     // Energy of y(n)

// Display results
disp("Energy of x(n) = " + string(Ex));
disp("Energy of y(n) = " + string(Ey));

// Define sample indices
nx = 0:length(x)-1; // n values for x(n)
ny = 0:length(y)-1; // n values for y(n)

// Create a figure for all plots
scf(0);
clf;

// Plot x(n) using plot2d3
subplot(3,1,1);
plot2d3(nx, x, style=5);  // style=5 for discrete points
plot(nx,x,"k.")
xtitle("x(n)", "n", "Amplitude");

// Plot y(n) using plot2d3
subplot(3,1,2);
plot2d3(ny, y, style=5);
plot(ny,y,"k.")
xtitle("y(n)", "n", "Amplitude");

// Plot energy comparison as discrete points using plot2d3
subplot(3,1,3);
bar([Ex Ey]);        // Bar graph comparing energies
xtitle("Energy comparison", "Signal", "Energy");  
