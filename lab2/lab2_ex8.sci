//lab2_ex8
clc;
clear;
close;

n=-2:1;
x=[1 -2 3 6];

//y1(n)=x(-n)
scf(1)

y1=x($:-1:1)
subplot(2,1,1)
plot2d3(n,x)
plot(n,x,"k.")
title("Original Signal x(n)")
xlabel("n")
ylabel("Amplitude")

subplot(2,1,2)
plot2d3(n,y1)
plot(n,y1,"r.")
title("Signal y1(n)=x(-n)")
xlabel("n")
ylabel("Amplitude")

//y2(n)=x(n+3)
scf(2)

n2=-5:-2
y2=x;
subplot(2,1,1)
plot2d3(n,x)
plot(n,x,"k.")
title("Original Signal x(n)")
xlabel("n")
ylabel("Amplitude")

subplot(2,1,2)
plot2d3(n2,y2)
plot(n2,y2,"r.")
title("Signal y2(n)=x(n+3)")
xlabel("n")
ylabel("Amplitude")

//y3(n)=2x(-n-2)
scf(3)

n3=-3:0
y3=2*y1;
subplot(2,1,1)
plot2d3(n,x)
plot(n,x,"k.")
title("Original Signal x(n)")
xlabel("n")
ylabel("Amplitude")

subplot(2,1,2)
plot2d3(n3,y3)
plot(n3,y3,"r.")
title("Signal y3(n)=2x(-n-2)")
xlabel("n")
ylabel("Amplitude")
