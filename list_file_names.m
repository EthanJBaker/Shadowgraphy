%This script loops through every file in a folder and lists the file names. 
%It serves as template code for looping through a folder and acting on each file within.

%dir_path : path to the folder where the photos are stored (must be a sub
%folder of ~\res
t each file in the folder

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