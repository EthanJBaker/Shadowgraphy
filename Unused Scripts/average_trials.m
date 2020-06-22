%This script loops through the resource folder. For each folder contained
%in MATLAB\res, the average of the images in the folder is saved to an
%output folder.

function []=average_trials()
%open the resource directory
trials = dir('res');
%trim the array so it contains only subfiles of res/
trials = trials(3:end);
%create output folder
out_dir_path ='output\trial_averages\';
if( exist(out_dir_path, 'dir') ~= 7 )
    mkdir(out_dir_path);
end
%loop through folders
for i = 1:length(trials)
%calculate the average of each image in the folder
average = average_images(trials(i).name);

%write average to the output folder
fout_path = [out_dir_path trials(i).name '-average.RAW'];
out_file = fopen(fout_path, 'w');
fwrite(out_file, average, 'uint8');
fclose(out_file);

%imshow(average, [0 255]);
end
fclose('all');
end