%This script takes in the name of a directory and loops through each file
%in the directory, displaying each photo. 

%The argument is the
%name of a directory that is a subfolder of MATLAB\res (this is where we
%will save the camera images).

%input dir_name : name of the folder where the photos are stored
%output s : the average image


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
end
s = s/length(contents); %divide by the number of images
figure;imshow(s);title('Average Image');
end