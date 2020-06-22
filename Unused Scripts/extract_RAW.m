%given a .RAW file as an input, returns an array containing the bitmap data
%need to supply relative path to image file
%this script simply displays the bitmap and returns an array representation
%argument file_path is the relative path of the file including file name.
function data=extract_RAW(file_path)
row = 3000;
col = 4096;
file = fopen(file_path, 'r');
%parse the file name to get the extension
[~, ~, file_ext] = fileparts(file_path);
%make sure the file is a RAW image file (prevents code from crashing if there
%is a file in the folder without a .RAW extension)
if (upper(file_ext) ~= ".RAW")
        fprintf("Error: file does not have RAW file extension\n");
        return
end
if (file == -1) 
    fprintf("Error: MATLAB was unable to open the file\n");
    return
end

%read in the data (it will be transposed)
[data, count] = fread(file,[col row], 'uint8=>uint8');
%tranpose the array
data = data';

%imshow(data, [0 255])
%fprintf('Number of characters read = %i\n', count)
fclose(file);
end