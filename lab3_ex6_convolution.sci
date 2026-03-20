// =========================================
// Lab3_ex6: Convolution (Tích chập)
// y(n) = x(n) * h(n)
// =========================================
clc;
clear;
close;

function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    yn = conv(xn, hn);
    yorigin = xorigin + horigin - 1;

    //Trục n thực
    n_x = (1:length(xn)) - xorigin;
    n_h = (1:length(hn)) - horigin;
    n_y = (1:length(yn)) - yorigin;
    
    // Trục chung
    n_min = min([n_x n_h n_y]);
    n_max = max([n_x n_h n_y]);
    n = n_min:n_max;
    
    // Khởi tạo = 0
    x_plot = zeros(n);
    h_plot = zeros(n);
    y_plot = zeros(n);
    
    // Gán giá trị vào đúng vị trí
    for i = 1:length(xn)
        idx = find(n == n_x(i));
        x_plot(idx) = xn(i);
    end
    
    for i = 1:length(hn)
        idx = find(n == n_h(i));
        h_plot(idx) = hn(i);
    end
    
    for i = 1:length(yn)
        idx = find(n == n_y(i));
        y_plot(idx) = yn(i);
    end

    //Vẽ đồ thị
    plot2d3(n, x_plot);
    p1=plot(n, x_plot, "k.");
    plot2d3(n, h_plot);
    p2=plot(n, h_plot, "b.");
    plot2d3(n, y_plot);
    p3=plot(n, y_plot, "r.");
    //xgrid();
    title("Tích chập");
    xlabel("n"); ylabel("Amplitude");
    legend([p1,p2,p3], ["x(n)","h(n)","y(n)"], "in_upper_right");
endfunction
