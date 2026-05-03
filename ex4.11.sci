clear;
clf;

// 1. Định nghĩa tín hiệu gốc x(n)
// n = [-3, -2, -1, 0, 1] tương ứng với {1, 0, -1, 2, 3}
n_x = -3:1;
x = [1, 0, -1, 2, 3];

// 2. Tạo hàm để lấy giá trị x(n) tại bất kỳ n nào (trả về 0 nếu ngoài dải)
function val = get_x(idx)
    if idx < -3 | idx > 1 then
        val = 0;
    else
        val = x(idx + 4); // +4 vì Scilab index bắt đầu từ 1
    end
endfunction

// 3. Tính toán y(n) dựa trên phân tích lý thuyết:
// y(n) = x_e(n+2) - j*x_o(n)
// Trong đó:
// x_e(n) = 0.5 * (x(n) + x(-n))
// x_o(n) = 0.5 * (x(n) - x(-n))

n_y = -5:3; // Dải n của y(n) sau khi dịch thời gian
y = zeros(1, length(n_y));

for i = 1:length(n_y)
    curr_n = n_y(i);
    
    n_shifted = curr_n + 2;
    xe_shifted = 0.5 * (get_x(n_shifted) + get_x(-n_shifted));
    
    xo = 0.5 * (get_x(curr_n) - get_x(-curr_n));
    
    y(i) = xe_shifted - %i * xo;
end

// 4. Vẽ đồ thị (Sketch)
clf();

subplot(2,1,1);
plot2d3(n_y, real(y));
plot2d(n_y, real(y), -9); 
xtitle("Phan thuc Re{y(n)}", "n", "Biên độ");
xgrid();

subplot(2,1,2);
plot2d3(n_y, imag(y));
plot2d(n_y, imag(y), -9);
xtitle("Phan ao Im{y(n)}", "n", "Biên độ");
xgrid();

disp("Chuoi y(n) tim duoc la:");
disp(y);
