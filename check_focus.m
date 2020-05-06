function check_focus(path)
%Call this script on an image to view the filled edge response
%This script is used to quickly determine if a shadowgraphy image is in focus
%input path: the file path to the image
%output: displays the transformed image
im = imread(path); %read the image
ed = edge(im, 'LoG', 2.03e-4,  2.5); %take the edge response (parameters chosen by experimentation)
fill = imfill(ed, 'holes'); %fill in any closed contours to make them visible
figure;imshow(fill); title(path); %display the iamge, title it with the file path

