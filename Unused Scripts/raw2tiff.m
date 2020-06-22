%This script converts raw images to .tif format
%It is the responsibility of the caller to ensure file path exists
%the .tif is saved to the working directory. 
function []=raw2tiff(file_path)
raw = extract_bitmap(file_path);
imwrite(raw, 'raw.tif')
end