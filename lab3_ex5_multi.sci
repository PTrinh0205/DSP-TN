// =========================================
// Lab3_ex5: Multiplication (Nhân tín hiệu)
// y(n) = x1(n).x2(n)
// =========================================
clc;
clear;
close;

function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
// --- Vị trí thực của x1 và x2 ---
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;

    // --- Khoảng chung ---
    n_min = min([n1, n2]);
    n_max = max([n1, n2]);
    n = n_min:n_max;
    N = length(n);

    // --- Khởi tạo vector zero ---
    tmp1 = zeros(1,N);
    tmp2 = zeros(1,N);

    // --- Ánh xạ x1n và x2n vào vector chung ---
    idx1 = n1 - n_min + 1; // luôn ≥ 1
    idx2 = n2 - n_min + 1; // luôn ≥ 1
    tmp1(idx1) = x1n;
    tmp2(idx2) = x2n;

    // --- Nhân phần tử ---
    yn = tmp1 .* tmp2;

    // --- Vị trí origin của y ---
    yorigin = 1 - n_min;

    plot2d3(n, tmp1);
    p1=plot(n, tmp1, "k."); // x1(n) màu đen
    plot2d3(n, tmp2);
    p2=plot(n, tmp2, "b."); // x2(n) màu xanh
    plot2d3(n, yn);
    p3=plot(n, yn, "r.");     // y(n) màu đỏ
    //xgrid();
    title("Nhân tín hiệu");
    xlabel("n"); ylabel("Amplitude");
    legend([p1,p2,p3], ["x1(n)","x2(n)","y(n)"], "in_upper_right");
endfunction
