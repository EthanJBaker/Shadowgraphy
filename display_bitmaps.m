%This script takes in the name of a directory and loops through each file
%in the directory, displaying each photo. 

%The argument is the
%name of a directory that is a subfolder of MATLAB\res (this is where we
%will save the camera images).

%dir_name : name of the folder where the photos are stored
%path : the relative path of the folder
%contents : struct array containing data about each file in the folder

function []=display_bitmaps(dir_name)
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
for i = 1:length(contents)
    %read image
    im = imread([path '\' contents(i).name]);
    %display image   
    figure;imshow(im);
    
    %this block below will find the edge response, fill in any holes, and
    %display the image. 
    %[ed, thresh] = edge(im, 'LoG', 2.03e-4,  2.5);
    %fill = imfill(ed, 'holes');
    %figure;imshow(fill);
    %title(contents(i).name);
end
pause(2);
close all
end