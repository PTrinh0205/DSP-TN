clc
clear
close
//ex 1.2
//x_a(t)
t=linspace(0,0.1,1000)
x_a=3*sin(100*%pi*t)
//x_n(n)
n=0:30
x_n=3*sin(%pi*n/3)
//x_q(n)
x_q=0.1*floor(x_n/0.1)
//draw
subplot(3,1,1)
plot2d(t,x_a)
title("Signal x_a(t)")
xlabel("t")
ylabel("Amplitude")

subplot(3,1,2)
plot2d3(n,x_n)
plot(n,x_n,'.k')
title("Signal x(n)")
xlabel("n")
ylabel("Amplitude")

subplot(3,1,3)
plot2d3(n,x_q)
plot(n,x_q,'k.')
title("Signal x_q(n)")
xlabel("n")
ylabel("Amplitude")
