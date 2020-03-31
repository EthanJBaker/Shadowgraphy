%This script takes in the name of a directory and loops through each file
%in the directory, printing out the name of each file. This script is
%intended to be run from the command prompt. 

%The argument is the
%name of a directory that is a subfolder of MATLAB\res (this is where we
%will save the camera images).

%dir_path : path to the folder where the photos are stored (must be a sub
%folder of ~\res
%path : the relative path of the folder
%contents : struct array containing data about each file in the folder

function []=list_file_names(dir_path)

%check if folder exists
if ( exist(dir_path, 'dir') ~= 7 )
    fprintf("Error. Folder not found in ~\\res\\. Try again.\n");
end
%dir pulls the data about each file in the folder
contents = dir(dir_path);
%first two entries are the folder itself and the parent, so we discard
contents = contents(3:end);
%loop through each file
for i = 1:length(contents)
   %print the name
   fprintf(contents(i).name + "\n")
end
end