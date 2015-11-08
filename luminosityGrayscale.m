function out = luminosityGrayscale(img);
# Converts an RGB image to grayscale with GIMP's luminosity algorithm (0.21R + 0.72G + 0.07B)

[d, n, b] = size(img);
out = 0.21*img(:,:,1) + 0.72*img(:,:,2) + 0.07*img(:,:,3);
