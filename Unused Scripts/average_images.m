%This script takes in the name of a directory and loops through each file
%in the directory. Script takes the average of all RAW images in the
%directory and saves the average. Average is calculated as a double and
%cast to uint8 before it is returned. 

%The argument is the
%name of a directory that is a subfolder of MATLAB\res (this is where we
%will save the camera images).

%dir_name : name of the folder where the photos are stored

function ave_image=average_images(dir_name)
%directory is a subfolder of ~\res, where ~ is the working directory
%construct relative path name by adding res\ as a prefix
inpath = ['res\' dir_name];
%check if folder exists
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
curr_image = [];
%define the array which will store the averages
numrows = 3000;
numcols = 4096;
ave_image = zeros([numrows numcols]);
%loop through each file

%we need to count the number of images that are processed
num_images = 0;
for i = 1:length(contents)
    %parse the file name to get the extension
    [file_path, file_name, file_ext] = fileparts(contents(i).name);
    %make sure the file is a RAW (prevents code from crashing if there
    %is a file in the folder without a .RAW extension
    if (upper(file_ext) ~= ".RAW")
        %this will skip the current file, increment i and go back through
        %the for loop
        continue
    end
    %if this code is executed, we know the file extension is correct
    num_images = num_images + 1;
    %read the image
    curr_image = extract_bitmap([inpath '\' contents(i).name]);
    [inpath '\' contents(i).name]
    %calculate the running sum
    ave_image = ave_image + double(curr_image);
    
end
%get the average from the sum and convert back to uint8
%length(contents) is the number of files in the directory we were passed. 
ave_image = ave_image / num_images;
%ave_image = uint8(ave_image);

%The commented code below is the code required to save the image. 
%make an output folder
% outpath = ['output\' dir_name '-out'];
% if ( exist(outpath, 'dir') ~= 7 )
%     mkdir(outpath)
% end
% out_file = fopen([outpath '\average-' dir_name '.RAW'], 'w');
% fwrite(out_file, ave_image, 'uint8');
% fclose(out_file);
%display the average image
%imshow(ave_image, [0 255])

fclose('all');
end