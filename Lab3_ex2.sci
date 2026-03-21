function [yn, yorigin] = advance(xn, xorigin, k)
    // --- 1. SIGNAL PROCESSING ---
    // If the shift exceeds the vector length,pad zeros to the RIGHT .
    if (xorigin + k) > length(xn) then
        // Padding zeros at the end to accommodate the new origin
        yn = [xn, zeros(1, (xorigin + k) - length(xn))];
    else
        yn = xn;
    end
    // Calculate the new origin position (index where n=0)
    // For advance, the origin index moves to the RIGHT (increases)
    yorigin = xorigin + k;
    // Generate time axes (n) for both signals
    nx = (1:length(xn)) - xorigin; // Time axis for original x(n)
    ny = (1:length(yn)) - yorigin; // Time axis for advanced y(n)
    
    // --- 2. PLOTTING SETUP ---
    n_min = min([nx, ny]);
    n_max = max([nx, ny]);
    n_plot = n_min:n_max; 
    
    x_plot = zeros(1, length(n_plot));
    y_plot = zeros(1, length(n_plot));
    
    // Map values to the common plot axis n_plot
    for i = 1:length(nx)
        x_plot(find(n_plot == nx(i))) = xn(i);
    end
    for i = 1:length(ny)
        y_plot(find(n_plot == ny(i))) = yn(i);
    end
    
    // --- 3. GRAPHICAL DISPLAY ---
    clf;    // Clear existing figures
    // Plot x(n): Blue stems and dots
    plot2d3(n_plot, x_plot, style=2); 
    p1 = gce(); // Capture handle for x(n)
    plot(n_plot, x_plot, "b."); 
    
    // Plot y(n): Red stems (style 5) and dots
    plot2d3(n_plot, y_plot, style=5); 
    p2 = gce(); 
    if ~isempty(p2.children) then
        p2.children(1).thickness = 2; // Thicker stems for the advanced signal
    end
    plot(n_plot, y_plot, "r."); 
    
    // --- 4. CONFIGURATION & LEGEND ---
    xtitle("Signal Advance: y(n) = x(n + " + string(k) + ")", "n", "Amplitude");
    // Legend for the stems
    legend([p1.children(1); p2.children(1)], ["x(n) Original"; "y(n) Advanced"]);
    xgrid();
    // Adjust axis bounds
    gca().data_bounds = [n_min, min(xn)-1; n_max, max(xn)+1];
    // Display results in console
    disp("yn =", yn);
    disp("yorigin =", yorigin);
    
endfunction

// --- EXAMPLE ---
// x(n) = {1, -2, 3(origin), 6}, Advance k = 2
//[yn, yorigin] = advance([1, -2, 3, 6], 3, 1);
