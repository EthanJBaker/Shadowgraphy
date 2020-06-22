%This script takes in the name of a directory and loops through each file
%in the directory, leaving a blank spot so something can be done to each file. 
%This code is a framework and is not inteded to be run without
%modification.

%The argument is the
%name of a directory that is a subfolder of MATLAB\res (this is where we
%will save the camera images).

%dir_name : name of the folder where the photos are stored
%path : the relative path of the folder
%contents : struct array containing data about each file in the folder

function []=file_loop(dir_name)
%directory is a subfolder of ~\res, where ~ is the working directory
%construct relative path name by adding res\ as a prefix
path = ['res\' dir_name];
%check if folder exists
if ( exist(path, 'dir') ~= 7 )
    fprintf("Error. Folder not found in ~\\res\\. Try again.\n");
end
%dir pulls the data about each file in the folder
contents = dir(path);
%first two entries are the folder itself and the parent, so we discard
contents = contents(3:end);
%loop through each file
for i = 1:length(contents)
    %do something
end
end