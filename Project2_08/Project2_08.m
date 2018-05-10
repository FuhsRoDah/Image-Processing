%Carleton Fuhs #08
%Project 2
%Part A

f = imread('P2image.tif');

w = [0,0,0;0,1,0;0,0,0]; %use this to subtract the laplacian filtered image
f1 = w - fspecial('laplacian', 0);%get the matrix from the direction sheet
g1 = imfilter(f,f1); %apply the filter to the image

%%
%Part B
%Used what we learned in Lecture16 to filter the image using the
%butterworth filter instead with a D0=256 and an order of 2

PQ(1) = 2^nextpow2(2*(max(size(f)))); 
PQ(2) = PQ(1);

H = hpfilter('btw', PQ(1), PQ(2), 256, 2);
H = ifftshift(H);

F = fft2(im2double(f), PQ(1), PQ(2));

fs = ifft2(H.*F);

fs = fs(1:size(f,1), 1:size(f,2));
fs = im2uint8(fs);

g2 = f + 2.*fs; %k=2 was what looked like the sharpest image to me

%%
%Part C
%The same as part B, except instead of using hpfilter, we use freqz2 to
%filter an image using the mask from part a

H3 = freqz2(f1,PQ(1),PQ(2));
H3 = ifftshift(H3);

F3 = fft2(im2double(f), PQ(1), PQ(2));

fs3 = ifft2(H3.*F);

fs3 = fs3(1:size(f,1), 1:size(f,2));
fs3 = im2uint8(fs3);

g3 = f + .01.*fs3;%.01 was the k value that I found that was the same as 
%part B and the difference between them was 0

ad=g3-g2;%absolute difference is 0, if you do imshow(ad) you will 
%get a blacked out image

