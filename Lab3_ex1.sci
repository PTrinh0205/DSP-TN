function [yn, yorigin] = delay(xn, xorigin, k)
    // --- 1. SIGNAL PROCESSING ---
    // Create yn by padding zeros at the beginning
    // This ensures the vector starts from n=0 if the delay k is large
    if (k - xorigin + 1) > 0 then
        yn = [zeros(1, k - xorigin + 1), xn];
    else
        yn = xn;
    end
    // Calculate the new origin position (index where n=0)
    yorigin = xorigin - k;
    if yorigin < 1 then
        yorigin = 1; // Scilab indices must start at 1
    end
    // Generate time axes (n) for both signals
    nx = (1:length(xn)) - xorigin; // Time axis for original x(n)
    ny = (1:length(yn)) - yorigin; // Time axis for delayed y(n)
    
    // --- 2. PLOTTING SETUP (Filling missing points with zeros) ---
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
    
    // --- 3. GRAPHICAL DISPLAY (Same Figure) ---
    clf;    // Clear existing figures
    // Plot x(n): Blue stems (style 2) and Blue dots ("b.")
    plot2d3(n_plot, x_plot, style=2); 
    p1 = gce(); // Capture handle for x(n) stems
    plot(n_plot, x_plot, "b."); // Blue dots
    
    // Plot y(n): Red stems (style 5) and Red dots ("r.")
    plot2d3(n_plot, y_plot, style=5); 
    p2 = gce(); // Capture handle for y(n) stems
    if ~isempty(p2.children) then
        p2.children(1).thickness = 2; // Make y(n) stems thicker for visibility
    end
    plot(n_plot, y_plot, "r."); // Red dots
    
    // --- 4. CONFIGURATION & LEGEND ---
    
    xtitle("Signal Delay: y(n) = x(n - " + string(k) + ")", "n", "Amplitude");
    
    // Legend points only to the polyline handles (stems) from plot2d3
    legend([p1.children(1); p2.children(1)], ["x(n)"; "y(n)"]);
    xgrid(); // Enable grid
    // Set axis bounds to fit the signal perfectly
    gca().data_bounds = [n_min, min(xn)-1; n_max, max(xn)+1];
    // Display results in the console
    disp("yn =", yn);
    disp("yorigin =", yorigin);
    
endfunction

// --- EXECUTION EXAMPLE ---
// Delay k = 1 for x(n) = {1, -2, 3(origin), 6}
//[yn, yorigin] = delay([1, -2, 3, 6], 3, 1);
