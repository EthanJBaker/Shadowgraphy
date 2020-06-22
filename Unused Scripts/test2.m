
dir_name = 'benchtest_3';
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
curr_image = [];
new_image = [];
%define the array which will store the averages
numrows = 3000;
numcols = 4096;

%The commented code below is the code required to save the image. 
%make an output folder
outpath = ['output\' dir_name '-out'];
if ( exist(outpath, 'dir') ~= 7 )
    mkdir(outpath)
end

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
    curr_image = extract_bitmap([inpath '\' contents(i).name]);
    new_image = curr_image - background;
    
    out_file = fopen([outpath '\bgfree-' contents(i).name '.BMP'], 'w');
    imwrite(new_image, fopen(out_file));
    fclose(out_file);
    
end

fclose('all');
