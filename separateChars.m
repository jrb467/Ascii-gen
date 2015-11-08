function out = separateChars(ascii);

# From the given ascii (8 bits wide per character), separate each character into its own matrix (stored in 3rd dim)

[d,n] = size(ascii);
out = reshape(ascii, d, 8, []);
