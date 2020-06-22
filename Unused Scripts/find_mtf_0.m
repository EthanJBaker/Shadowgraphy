% This script takes in
%The image is stored in 0_cropped_gimp.BMP
image = extract_bitmap('res\0_cropped_gimp.BMP');
[row col] = size(image);
%init xsin50_im, the ideal image
% xsin50_im = zeros(size(image));
% for i=1:size(xsin50_im, 2)
%     if ( ((0.2*size(xsin50_im, 2) < i) && (i < 0.4*size(xsin50_im, 2))) || ((0.6*size(xsin50_im, 2) < i) && (i < 0.8*size(xsin50_im, 2))) )
%     xsin50_im(:, i) = 1;
%     end
% end
% xsin50_im = mat2gray(xsin50_im);
% imshow(xsin50_im);
% image = xsin50_im;
% image = image';
%The object should be 5 vertical bars of uniform width alternating black
%and white, starting with black on the left.
object = zeros(size(image)); %Make the whole thing black
for i = 1:size(object, 2)
    if ( ( size(object, 2) / 5 ) < i && i < (2* size(object, 2) / 5 ))
        object(:, i) = 1; %pixels in the second column are white
    elseif ( (3* size(object, 2) / 5 ) < i && i < (4* size(object, 2) / 5 ))
        object(:, i) = 1; %pixels in the fourth column are white
    end
end

fgh = figure('Name', 'Spatial Domain');
subplot(1, 2, 1), imshow(mat2gray(object)), title('Object');
subplot(1, 2, 2), imshow(mat2gray(image)), title('Image');

mag_log_fft_object = abs(log(fftshift(fft2(object))));
mag_log_fft_image = abs(log(fftshift(fft2(image)))); %FIX THIS WHEN DONE
% abs(log(fftshift(fft2(object))));
% fgh0 = figure('Name', 'Spatial Frequency Domain, log magnitude plots');
% subplot(1, 2, 1), imshow(mat2gray(mag_log_fft_object)), title('Object');
% subplot(1, 2, 2), imshow(mat2gray(mag_log_fft_image)), title('Image');

%Check if the columns of mag_log_fft_object are lin. indep

MTF_unnormalized = pinv(fft2(object)) * fft2(image);
figure; surf(mat2gray(abs(log(fftshift(MTF_unnormalized)))));

MTF_space = ifft2(MTF_unnormalized);
%imshow(mat2gray(abs((log(fftshift(MTF_space)))));