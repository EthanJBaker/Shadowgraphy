%Given the path of a RAW or BMP uint8 image file, this script displays that image.
%Whoever calls this function is responsible for ensuring the image is a
%RAW/BMP file and that the file_name is a valid path, either an absolute path, a
%relative path from the current directory, or accessible from the MATLAB
%path. 
function []=display_image(file_name)
%get file extension
[~,~,file_ext] = fileparts(file_name);
%determine which exraction function to use
if (upper(file_ext) == '.BMP')
    image = extract_bitmap(file_name);
elseif ( upper(file_ext) == '.RAW' )
    image = extract_RAW(file_name);
else
    fprintf("Error: File name does not end in RAW or BMP")
end
%display the image
imshow(image, [0 255]);
end
