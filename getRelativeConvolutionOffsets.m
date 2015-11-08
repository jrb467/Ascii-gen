function [oX, oY] = getRelativeConvolutionOffsets(convolve, offX, offY);
# Calculates how much a given pixel would have impacted the blurred result as a decimal, based on a certain convolution matrix
# If the given matrix has an even dimension, the center point is given to the higher index (tends towards bottom right)
# Zero-indexed

[d,n] = size(convolve);
if mod(d,2) == 0
	oY = d/2;
else
	oY = (d-1)/2;
endif
	
if mod(n,2) == 0
	oX = n/2;
else
	oX = (n-1)/2;
endif
