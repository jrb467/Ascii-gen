function out = convolve(input, convolutionMat);
# Convolutes the input image into out. Outside of the image is treated as zero
# Operates on a 2D image with multiple pixel values (RGB/RGBA)
# Expects the convolution matrix is normalized in the desired fashion
# Requires casting back to uint8

#The offsets should be the offsets from convolutionMat(1,1) to the "center" pixel (the pixel it operates on)
[oX,oY] = getRelativeConvolutionOffsets(convolutionMat);
[d,n] = size(convolutionMat);
op = extendMatrix(input, oX, n-oX-1, oY, d-oY-1);
res = convn(op, convolutionMat, "same");
[rd,rn,~] = size(res);
left = oX+1;
right = rn-(n-oX-1);
top = oY+1;
bottom = rd-(d-oY-1);
out = res(top:bottom, left:right,:);
