%This is an exploratory script used to try out a few convolutional filters than are used in image processing. 
%The Circular Hough Transform is also briefly explored as a method for detecting circles in an image

%read in a test image (this path is now meaningless)
im=imread('res\125us\exo304MGE_50199_20785_148121551581.BMP');
%convert the image to a double and normalize it so the max element is 1
im = double(im); im = im ./ max(max(im));

%these matrices are basic convolution kernels. 
sharp1 = [-1 -1 -1; -1 9 -1; -1 -1 -1]; %a sharpening filter
sharp2 = [0 -1 0; -1 5 -1; 0 -1 0]; %a different sharpening filter
edge_mat = [-1 -1 -1; -1 8 -1; -1 -1 -1]; %edge detection kernel

%filter the image by convolving it with each matrix.
sharp_im1 = conv2(im, sharp1, 'same');
sharp_im2 = conv2(im, sharp2, 'same');
edge_im = conv2(im, edge_mat, 'same');

%for comparison to edge_im, the usual edge detection method is used
[ed, ~] = edge(im, 'LoG', 2.03e-4,  2.5);

%Circular Hough Transform searching for circles with radii between 30 and 90 pixels
[centers, radii] = imfindcircles(im, [30 90]);

%display the image and superimose red outlines over detected circles
figure; imshow(im); title('Circ. Hough Trans');
viscircles(centers, radii);
% subplot(1,3,1), imshow(im), title('Image');
% subplot(1,3,2), imshow(sharp_im1), title('Sharp1');
% subplot(1,3,3), imshow(sharp_im2), title('Sharp2');