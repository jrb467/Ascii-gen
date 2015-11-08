function cls = toAscii(M, w);

# Takes an already-processed image and returns the ascii classification

[d,n,b] = size(w);
[md,mn] = size(M);
newWidth = mn - mod(mn, n);
newHeight = md - mod(md, d);
M = resize(M, newHeight, newWidth);
# Number of chars before a newline
chunkWidth = floor(mn/n);
chunkHeight = floor(md/d);

cls = zeros(chunkHeight, chunkWidth);
filter = fspecial("gaussian", [35 15], 8);

for i = 1:chunkHeight
	for j = 1:chunkWidth
		sect = M(((i-1)*d+1):(i*d), ((j-1)*n+1):(j*n));
		cls(i,j) = classifyChar(sect, w, filter);
	endfor
endfor
