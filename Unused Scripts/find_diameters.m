clear, clc;
dir_name = '7-16-2019';
inpath = ['res\' dir_name];
if ( exist(inpath, 'dir') ~= 7 )
    fprintf("Error. Folder not found in ~\\res\\. Try again.\n");
    return
end

%dir() pulls the data about each file in the folder
contents = dir(inpath);
%first two entries are the folder itself and the parent, so we discard the
%first 2 elements of the array
contents = contents(3:end);
%preallocate bitmap array variable which stores the image data
%I'm not sure if this is necessary

%define the array which will store the averages
numrows = 3000;
numcols = 4096;


%we need to count the number of images that are processed
num_images = 0;
for i = 1:length(contents)
    %parse the file name to get the extension
    [file_path, file_name, file_ext] = fileparts(contents(i).name);
    %make sure the file is a RAW (prevents code from crashing if there
    %is a file in the folder without a .RAW extension
    if (upper(file_ext) ~= ".BMP")
        %this will skip the current file, increment i and go back through
        %the for loop
        continue
    end
    %if this code is executed, we know the file extension is correct
    num_images = num_images + 1;
    %read the image
    im = extract_bitmap([inpath '\' contents(i).name]);
 
    im_edge = edge(im, 'LoG');
    %imshow(sharp_edge);
    im_full = imfill(im_edge, 'holes');
    
    stats = regionprops('table',im_full,'Centroid',...
        'MajorAxisLength','MinorAxisLength');
    %sort by minor axis length
    dots = sortrows(stats, 3, 'descend');
    dots = dots(1, :);
    
    centers = dots.Centroid;
    diameters = mean([dots.MajorAxisLength dots.MinorAxisLength],2);
    radii = diameters/2;
    
    imshow(im_full)
    hold on
    viscircles(centers,radii);
    hold off
    
    fprintf("File %s yields diameter %i \n", contents(i).name, round(radii));
end

fclose('all');
