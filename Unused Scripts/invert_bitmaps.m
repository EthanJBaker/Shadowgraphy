%This script takes in the name of a directory and loops through each file
%in the directory. For each image, the script inverts the image and saves a
%copy to the output folder. 

%The argument is the
%name of a directory that is a subfolder of MATLAB\res (this is where we
%will save the camera images).

%dir_name : name of the folder where the photos are stored
%path : the relative path of the folder
%contents : struct array containing data about each file in the folder

function []=invert_bitmaps(dir_name)
%directory is a subfolder of ~\res, where ~ is the working directory
%construct relative path name by adding res\ as a prefix
inpath = ['res\' dir_name];
outpath = ['output\' dir_name '-out'];
%check if folder exists
if ( exist(inpath, 'dir') ~= 7 )
    fprintf("Error. Folder not found in ~\\res\\. Try again.\n");
    return
end

%make an output folder
if ( exist(outpath, 'dir') ~= 7 )
    mkdir(outpath)
end

%dir pulls the data about each file in the folder
contents = dir(inpath);
%first two entries are the folder itself and the parent, so we discard
contents = contents(3:end);
%preallocate bitmap array variable which stores the image data
bitmap = []; 
%loop through each file
for i = 1:length(contents)
    %parse the file name to get the extension
    [file_path, file_name, file_ext] = fileparts(contents(i).name);
    %make sure the file is a bitmap (prevents code from crashing if there
    %is a file in the folder without a .bmp extension
    if (upper(file_ext) ~= ".RAW")
        continue
    end
    %read the image
    bitmap = extract_bitmap([inpath '\' contents(i).name]);
    %subtract each pixel value from 255 to invert it
    inverted = 255*ones(size(bitmap), 'uint8') - bitmap;
    %write the inverted image
    out_file = fopen([outpath '\inverted-' contents(i).name], 'w');
    fwrite(out_file, inverted, 'uint8');
    fclose(out_file);
    %display the inverted image
    imshow(inverted, [0 255])
end
fclose('all');
end