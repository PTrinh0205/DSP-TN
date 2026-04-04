clc;
clear;

x = [1 2 -3 2 1];
h = [1 0 -1 -1 1];
N = length(x);
M = length(h);

//Matrix method
if M < N then
    h = [h zeros(1, N-M)];
end

// tạo circulant matrix từ x
X = zeros(N, N);

for i = 1:N
    for j = 1:N
        index = modulo(i - j + N, N) + 1;
        X(i,j) = x(index);
    end
end

y = X * h';

disp("Matrix X = ");
disp(X);

disp("y(n) = ");
disp(y);

//Draw x(n), y(n) and energy of discrete signals
n = 0:N-1;
Ex = sum(x.^2);
Ey = sum(y.^2);
disp("Ex=",Ex);
disp("Ey=",Ey);

clf;
plot2d3(n, x); 
plot2d3(n, y);
plot2d3(n, x.^2);
plot2d3(n, y.^2);

// Vẽ các điểm màu để tạo legend
p1 = plot(n, x, 'b.');     
p2 = plot(n, y, 'r*');     
p3 = plot(n, x.^2, 'm*');  
p4 = plot(n, y.^2, 'k^');  

poly1 = p1.children(1);
poly1.mark_size = 10;

poly2 = p2.children(1);
poly2.mark_size = 20;

poly3 = p3.children(1);
poly3.mark_size = 22;

poly4 = p4.children(1);
poly4.mark_size = 6;

// Thiết lập bound: [x_min, y_min; x_max, y_max]
gca().data_bounds = [-0.5, -5; 4.5, 18]; 

xtitle("x(n), y(n) and Energy", "n", "Amplitude");
legend([p1, p2, p3, p4], ["x(n)", "y(n)", "x^2(n)", "y^2(n)"], opt=1);
