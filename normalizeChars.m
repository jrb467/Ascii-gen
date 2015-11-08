function out = normalizeChars(imgSep);

# Normalizes such that the character with the same shape as the input (with maximum contrast) gets a maximum classification of 1, and its opposite gets -1

[d,n,b] = size(imgSep);
t = 255 - double(imgSep);
out = zeros(d,n,b);
for i = 1:b
	out(:,:,i) = t(:,:,i) / sqrt(sum(sum(t(:,:,i) .** 2)));
endfor
