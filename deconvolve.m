function out = deconvolve(input, convolveMat, iterations);
# Deconvolves an image, based on the input (estimated) convolution matrix

# Sets the initial MLE estimate of the final image as the input image
prediction = input;

# Note: apparently the second parameter for the outer convolve should be the "flipped point spread function" - change if it doesn't work
for i = 0:iterations
	prediction = prediction .* convolve((double(input) ./ double(convolve(prediction, convolveMat))), flipud(fliplr(convolveMat)));
endfor

out = prediction;
