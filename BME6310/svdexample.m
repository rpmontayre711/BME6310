clear

%I = imread('pout.tif');  %pout.tif  cell.tif 
% or mystery.jpeg --> rgb2gray
I = imread('BROCKHAMPTON.jpeg');
I = rgb2gray(I);
subplot(1,3,1);
imshow(I);
I2 = double(I);
waitforbuttonpress;

[u,s,v] = svd(I2);
subplot(1,3,2); 
hold on; axis([0 size(s,1) 0 1]);
total = 0;
sum_s = sum(diag(s));
for i = 1:size(s,2) %1 or 2
    total = total+s(i,i);
    plot(i,(total/sum_s),'bo');
end
hold off;
waitforbuttonpress;


subplot(1,3,3); colormap(gray)
s_modes = zeros(size(s));
for i = 1:size(s);
    s_modes(i,i) = s(i,i);
    image_modes = u*s_modes*v';
    imagesc(image_modes);
    fig_title = strcat('mode # ',int2str(i));
    title(fig_title);
    waitforbuttonpress;
end