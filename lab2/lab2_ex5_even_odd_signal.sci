//lab2_ex5
clc;
clear;
close;

n=-1:1;
x=[1 3 -2];

x_flip = x($:-1:1)
xe=(x+x_flip)/2;
xo=(x-x_flip)/2;

subplot(3,1,1)
plot2d3(n,x)
plot(n,x,"r.")
title("Original Signal x(n)")
xlabel("n")
ylabel("Amplitude")

subplot(3,1,2)
plot2d3(n,xe)
plot(n,xe,"r.")
title("Even Component xe(n)")
xlabel("n")
ylabel("Amplitude")

subplot(3,1,3)
plot2d3(n,xo)
plot(n,xo,"r.")
title("Odd Component xo(n)")
xlabel("n")
ylabel("Amplitude")
