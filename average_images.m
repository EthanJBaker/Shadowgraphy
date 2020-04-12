%This script takes in the name of a directory and loops through each file
%in the directory, displaying each photo. 

%The argument is the
%name of a directory that is a subfolder of MATLAB\res (this is where we
%will save the camera images).

%dir_name : name of the folder where the photos are stored
%path : the relative path of the folder
%contents : struct array containing data about each file in the folder

function s=average_images(dir_name)
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
figure;imshow(s);title('Average Image');
for i = 1:length(contents)
    %read image
    im = imread([path '\' contents(i).name]);
    im = double(im);
    %add to running sum   
    new_im = im - s;
    figure; 
    subplot(2,1,1), imshow(im, [0 255]), title('Original');
    subplot(2,1,2), imshow(new_im, [0 255]), title('Background Removed');
    %this block below will find the edge response, fill in any holes, and
    %display the image. 
    %[ed, thresh] = edge(im, 'LoG', 2.03e-4,  2.5);
    %fill = imfill(ed, 'holes');
    %figure;imshow(fill);
    %title(contents(i).name);
end
close all
end