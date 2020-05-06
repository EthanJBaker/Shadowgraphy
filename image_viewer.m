%This script loops through the images in a folder and displays them.
%This script was created to test the logic of the image_viewer_gui script. Now that that script works, 
%this script is unecessary.

%dir_path : path to the folder where the photos are stored 

function []=image_viewer(dir_path)

%check if folder exists
if ( exist(dir_path, 'dir') ~= 7 )
    fprintf("Error. Folder not found in ~\\MATLAB\\. Try again.\n");
end
%dir pulls the data about each file in the folder
contents = dir(dir_path);
%first two entries are the folder itself and the parent, so we discard
contents = contents(3:end);
%loop through each file
images = cell(size(contents));
for i = 1:length(contents)
   %print the file name
   fprintf(contents(i).name + "\n");
   %construct the file path 
   im_path = strcat(dir_path, '\', contents(i).name);
   %read and display the image
   images{1, i} = imread(im_path);
   figure; imshow(images{1, i});
end
end