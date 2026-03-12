//lab2_ex7
clc;
clear;
close;

n = -1:3;
x1 = [0 0 1 3 -2];
x2 = [0 1 2 3 0];
y = x1 .* x2;

subplot(3,1,1)
plot2d3(n,x1)
plot(n,x1,"k.")
title("x1(n)")
xlabel("n")
ylabel("Amplitude")

subplot(3,1,2)
plot2d3(n,x2)
plot(n,x2,"k.")
title("x2(n)")
xlabel("n")
ylabel("Amplitude")

subplot(3,1,3)
plot2d3(n,y)
plot(n,y,"k.")
title("y(n)=x1(n).x2(n)")
xlabel("n")
ylabel("Amplitude")
