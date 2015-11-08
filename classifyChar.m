function out = classifyChar(in, w, filter);

# Classifies an input character (assumes it is 18x8, or 18 rows, in size)

[d,n,b] = size(w);
ivec = (double(in) + 0.01);
# c = sum(sum(ivec .* w));
# c = max(max(convn(ivec, w)(5:13,3:6,:)));
c = max(max(filter .* convn(ivec, w)));
[m, ind] = max(c);
out = ind;
