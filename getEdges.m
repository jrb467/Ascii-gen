function out = getEdges(I);
# Outputs a matrix with the edges of an images

[d,n,s] = size(I);
# gradient cascade? (performed on edges)
# if neighbor weight is high (nH) lose gradient, neihbor gains (choose direction for bias)
# if neighber weight is low (nL) stay static (gain weight from other side if on gradient)
# If no edge - nothing should happen 
vedges = convolve(I, [-1; -1; 1; 1; 0; 0]);
hedges = convolve(I, [-1 -1 1 1 0 0]);
edges = (vedges .** 2) + (hedges .** 2);
# Note: used to be sqrt(edges). Trying some weird stuff
out = sqrt(edges);
# out = 255 ./ (1 + 3000000*exp(-0.2*out));
