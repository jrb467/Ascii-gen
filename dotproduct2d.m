function s = dotproduct2d(a, b);

# Takes the 2d "dot product" (sums the product of every element with the similarly indexed element in the other matrix)

s = sum(sum(a .* b));
