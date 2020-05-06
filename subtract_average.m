%This script takes the average of all the images in the folder, and then substracts this average from each image in the folder. 
%This script is largely used for experimentation with the average image and background subtraction. It is not used to process test images. 


function s=subtract_average(dir_name)
%directory is a subfolder of ~\res, where ~ is the working directory
%construct relative path name by adding res\ as a prefix
path = ['res\' dir_name];
%check if folder exists
if ( exist(path, 'dir') ~= 7 )
    fprintf("Error. Folder not found in ~\\res\\. Try again.\n");
    return
end
%dir pulls the data about each file in the folder
contents = dir(path);
%first two entries are the folder itself and the parent, so we discard
contents = contents(3:end);
%preallocate array variable which stores the image data
%loop through each file
row =3000;
col= 4096;
s = zeros(row, col);

for i = 1:length(contents)
    %read image
    im = imread([path '\' contents(i).name]);
    im = double(im);
    im = im ./ max(max(im));
    %add to running sum   
    s = s + im;
    
    %this block below will find the edge response, fill in any holes, and
    %display the image. 
    %[ed, thresh] = edge(im, 'LoG', 2.03e-4,  2.5);
    %fill = imfill(ed, 'holes');
    %figure;imshow(fill);
    %title(contents(i).name);
end
s = s/length(contents);
figure;imshow(s, [0 1]);title('Average Image');
for i = 1:2
    %read image
    im = imread([path '\' contents(i).name]);
    im = double(im);
    im = im ./ max(max(im));

    new_im = im - s; new_im = new_im/max(max(new_im));
    [ed, thresh] = edge(im, 'LoG', 2.03e-4,  2.5);
    fill = imfill(ed, 'holes');
    [new_ed, ~] = edge(new_im, 'LoG', 2.03e-4,  2.5);
    new_fill = imfill(new_ed, 'holes');

    figure; 
    subplot(2,2,1), imshow(im, [0 1]), title('Original');
    subplot(2,2,2), imshow(new_im, [0 1]), title('Background Removed');
    subplot(2,2,3), imshow(fill), title('Original Edge Response');
    subplot(2,2,4), imshow(new_fill), title('New Edge Response');
    %this block below will find the edge response, fill in any holes, and
    %display the image. 
 
    
end

end