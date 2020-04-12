im=imread('res\125us\exo304MGE_50199_20785_148121551581.BMP');
im = double(im); im = im ./ max(max(im));
im = (im-s) ./ max(max(im-s));

sharp1 = [-1 -1 -1; -1 9 -1; -1 -1 -1];
sharp2 = [0 -1 0; -1 5 -1; 0 -1 0];
edge_mat = [-1 -1 -1; -1 8 -1; -1 -1 -1];

sharp_im1 = conv2(im, sharp1, 'same'); 
sharp_im2 = conv2(im, sharp2, 'same');
edge_im = conv2(im, edge_mat, 'same');


[ed, ~] = edge(im, 'LoG', 2.03e-4,  2.5);

%Circular Hough Transform
[centers, radii] = imfindcircles(im, [30 90]);


figure; imshow(im); title('Circ. Hough Trans');
viscircles(centers, radii);
% subplot(1,3,1), imshow(im), title('Image');
% subplot(1,3,2), imshow(sharp_im1), title('Sharp1');
% subplot(1,3,3), imshow(sharp_im2), title('Sharp2');