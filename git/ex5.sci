close;

// 1. LOAD IPCV TOOLBOX
if ~atomsIsLoaded("IPCV") then
    atomsLoad("IPCV");
end

// 2. IMAGE ACQUISITION AND PRE-PROCESSING
img = imread("logo.png"); 
gray = rgb2gray(img); // Convert input image to Grayscale

// 3. IMAGE PROCESSING ALGORITHMS
// A. Histogram Equalization
// Enhances the contrast by redistributing pixel intensities
eq = imhistequal(gray);

// B. Image Blurring (Smoothing)
// Applies a 5x5 Average filter to reduce noise
h = fspecial('average', 5);
blur = imfilter(gray, h);

// C. Visible Watermarking
// Creates a white rectangular block at the top-left corner
wm = gray; 
wm(10:40, 10:120) = 255; 

// 4. DISPLAY WINDOW 1: IMAGE PROCESSING RESULTS (2x2 Grid)
scf(1); clf();
f1 = gcf();
f1.figure_name = "Image Processing Results";

subplot(2, 2, 1); imshow(gray); title("1. Original Grayscale");
subplot(2, 2, 2); imshow(eq);   title("2. Equalized Image");
subplot(2, 2, 3); imshow(blur); title("3. Blur Image (5x5 Average)");
subplot(2, 2, 4); imshow(wm);   title("4. Watermark Image (Visible)");

// 5. DISPLAY WINDOW 2: HISTOGRAM ANALYSIS (1x2 Grid)
scf(2); clf();
f2 = gcf();
f2.figure_name = "Histogram Analysis";

// Original Histogram
subplot(1, 2, 1);
histplot(256, double(gray(:)), normalization=%f);
xtitle("Histogram of Original Image", "Gray Level (0-255)", "Number of Pixels");

// Equalized Histogram
subplot(1, 2, 2);
histplot(256, double(eq(:)), normalization=%f);
xtitle("Histogram after Equalization", "Gray Level (0-255)", "Number of Pixels");

show_window();
disp("Program executed successfully.");
