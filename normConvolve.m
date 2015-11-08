function out = normConvolve(in);
# Normalizes a matrix so the sum of all its elements is 1. Assumes the input is 2D

out = in/sum(sum(in));
