%im = extract_bitmap('res\75cm\neg_10\exo304MGE_50199_35886_250141618875.BMP');
im = imread('res\ice.png');
im = rgb2gray(im);
im_edge = edge(im, 'LoG', 2.03e-4,  2.5);
%imshow(sharp_edge);
im_full = imfill(im_edge, 'holes');
im_full = im_full- im_edge;
stats = regionprops('table',im_full,'Centroid',...
    'MajorAxisLength','MinorAxisLength');
%sort by minor axis length
dots = sortrows(stats, 3, 'ascend')
dots = dots(1, :);

centers = dots.Centroid;
diameters = mean([dots.MajorAxisLength dots.MinorAxisLength],2);
radii = diameters/2;

imshow(im_full)
hold on
viscircles(centers,radii);
hold off

%fprintf("File %s yields diameter %i", contents(i).name, round(radii));