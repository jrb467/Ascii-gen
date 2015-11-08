function [cls, M] = asciigen(file, edgeWeight, w);

# Given a filename for an image, converts it to an ascii picture (printed to stdout for now)
# Also takes in edgeWeight (0 to 1) that determines how much the edges are favored over brightness
# Last 3 parameters are the weight vectors for the characters, the character's index in the ascii string, and the actual ascii string
# STEPS
#  - Load image
#  - Convert to grayscale (luminosityGrayscale)
#  - Load in ascii weights
#  - Tile the input image into 18x8 segments (trimming if necessary): take note on how wide a row is (for newlines)

[I,map] = imread(file);
[~,~,depth] = size(I);
if (depth < 3)
    B = ind2gray(I,map);
else
    B = luminosityGrayscale(I);
endif
G = 255*edge(B, "Canny", 5);
# E = 255*(1 - edge(B, "Sobel"));
M = edgeWeight * G + (1 - edgeWeight) * (255 - B);
M = convolve(M, [0.5 1 0.5; 1 1.3 1; 0.5 1 0.5]);

cls = toAscii(M, w);