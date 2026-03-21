function [yn, yorigin] = fold(xn, xorigin)
    // --- 1. SIGNAL PROCESSING ---
    
    // Reverse the vector to perform y(n) = x(-n)
    yn = xn($:-1:1); 
    
    // Calculate the new origin position in the reversed vector
    // Example: if xn=[1, 2, 3] and xorigin=1, then yn=[3, 2, 1] and yorigin=3
    yorigin = length(xn) - xorigin + 1;
    
    // Generate time axes (n) for both signals
    nx = (1:length(xn)) - xorigin; // Original time axis
    ny = (1:length(yn)) - yorigin; // Folded time axis (should be -nx reversed)
    
    // --- 2. PLOTTING SETUP ---
    n_min = min([nx, ny]);
    n_max = max([nx, ny]);
    n_plot = n_min:n_max; 
    
    x_plot = zeros(1, length(n_plot));
    y_plot = zeros(1, length(n_plot));
    
    // Map values to the common plot axis
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
    p1 = gce(); 
    plot(n_plot, x_plot, "b."); 
    
    // Plot y(n): Red stems (style 5) and dots
    plot2d3(n_plot, y_plot, style=5); 
    p2 = gce(); 
    if ~isempty(p2.children) then
        p2.children(1).thickness = 2; // Thicker stems for the folded signal
    end
    plot(n_plot, y_plot, "r."); 
    
    // --- 4. CONFIGURATION & LEGEND ---
    xtitle("Signal Folding: y(n) = x(-n)", "n", "Amplitude");
    
    // Legend for the stems only
    legend([p1.children(1); p2.children(1)], ["x(n) Original"; "y(n) Folded"]);
    xgrid();
    // Adjust axis bounds
    gca().data_bounds = [n_min, min(xn)-1; n_max, max(xn)+1];
    // Display results in console
    disp("yn =", yn);
    disp("yorigin =", yorigin);
    
endfunction

// --- EXAMPLE ---
//[yn, yorigin] = fold([1, -2, 3, 6], 3);
