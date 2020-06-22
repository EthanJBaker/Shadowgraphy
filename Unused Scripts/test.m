image = extract_bitmap('res\circle\0_cropped_gimp.BMP');
[row, col] = size(image);
% Create a logical image of a circle with specified
% diameter, center, and image size.
% First create the image.
imageSizeX = row;
imageSizeY = col;
[columnsInImage rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);
% Next create the circle in the image.
centerX = round(0.5*row);
centerY = round(0.5*col);
radius = round(0.45*min(row, col));
object = (rowsInImage - centerY).^2 ...
    + (columnsInImage - centerX).^2 <= radius.^2;
object = ~object;
% object is a 2D "logical" array.
F = abs(log(fftshift(fft2(image))));
G = abs(log(fftshift(fft2(object))));
H = abs(log(fftshift(fft2(image) * pinv(fft2(object)))));

figure;
subplot(1,2,1), imshow(object), title('Object');
subplot(1,2,2), imshow(image), title('Image');

figure;
imshow(mat2gray(H));
a) = H;