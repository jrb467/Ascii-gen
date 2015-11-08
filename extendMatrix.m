function out = extendMatrix(input, left, right, top, bottom);
# Extends the edges of matrix using it's edge values
# Assumes 3 dimensional

[d,n,~] = size(input);
c1 = input(:,1,:);
cn = input(:,n,:);
out = cat(2,repmat(c1,1,left),input);
out = cat(2,out,repmat(cn,1,right));
r1 = out(1,:,:);
rd = out(d,:,:);
out = cat(1,repmat(r1,top,1),out);
out = cat(1,out,repmat(rd,bottom,1));
