%This script is for testing purposes only and is liable to change at any
%time. 
%extract image
sharp = extract_bitmap('res\0.bmp');
blurry = extract_bitmap('res\500.bmp');
%sum fft along each row
s_fft = zeros(size(sharp(1,:)));
b_fft = s_fft;
for i = 1:size(sharp,1)
    s_fft = s_fft + fft(sharp(i,:));
    b_fft = b_fft +  fft(blurry(i,:));
end
s_fft = s_fft / i;
b_fft = b_fft / i;
s_logmag = log(abs(s_fft));
b_logmag = log(abs(b_fft));
s2 = log(abs(fft2(sharp)));
b2 = log(abs(fft2(blurry)));
subplot(3, 1, 1), plot(s_logmag), title('Sharp');
subplot(3, 1, 2), plot(b_logmag), title('Blurry');
subplot(3, 1, 3), plot(log(abs(s_fft-b_fft))), title('Sharp - Blurry');