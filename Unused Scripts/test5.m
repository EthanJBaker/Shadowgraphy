im = extract_bitmap('res\0\');
ed = edge(im, 'LoG');
fill = imfill(ed, 'holes');
imshow(fill);