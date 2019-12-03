%% image interpolation

Owl = imread('ECA_ICAjunction.jpg');
Owl1 = im2double(Owl);
figure(1); hold on;
subplot(1,3,1);
imagesc(Owl1); colormap(gray);
for i=1:72, for j=1:128
        Owl_sparse(i,j) = Owl1(i*10,j*10);
end, end
title('Owl');
subplot(1,3,2);
imagesc(Owl_sparse); colormap(gray);
title('Owl Sparse');

%%
[Xi,Yi] = ndgrid(1:.05:72,1:.05:128);
[X,Y] = ndgrid(1:72,1:128);
Owl_sparse_i = interpn(X, Y, Owl_sparse, Xi, Yi, 'spline');
colormap gray
axis off
title('Owl Sparse');
subplot(1,3,3); 
imagesc(Owl_sparse_i)
axis off
title('Owl sparse interpolated');

