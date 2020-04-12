function edge_response(path)
im = imread(path);
ed = edge(im, 'LoG', 2.03e-4,  2.5);
fill = imfill(ed, 'holes');
figure;imshow(fill); title(path);

