path = 'res\7-16-2019\neg_10.bmp';
im = extract_bitmap(path);
im_edge = edge(im, 'LoG');
    %imshow(sharp_edge);
    im_full = imfill(im_edge, 'holes');
    
    stats = regionprops('table',im_full,'Centroid',...
        'MajorAxisLength','MinorAxisLength');
    %sort by minor axis length
    dots = sortrows(stats, 3, 'descend');
    dots = dots(1, :);
    
    centers = dots.Centroid;
    diameters = sqrt(dots.MajorAxisLength * dots.MinorAxisLength);
    radii = diameters/2;
    round(diameters)
    imshow(im_full)
    hold on
    viscircles(centers,radii);
    hold off