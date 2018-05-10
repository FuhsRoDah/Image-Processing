%
%
function [BW, ratio, count] = Project4_08(f)
%f = imread('P4image.tif');
BW = f>160; %threshold the image to get the bubbles separated from the background
se = strel('diamond', 8); %this worked the best with the erosion of the image
BW = imerode(BW,se);%eroded the image to separate the bubbles that were clustered
se2 = strel('disk', 5);%this worked best to dilate the image
BW = imdilate(BW,se2);%dilated the image to better show where the bubbles
CC = bwconncomp(BW); %finds the connected components in the image
count = CC.NumObjects; %counts the number of objects found in the image

BWr = imbinarize(f); %this image is used to find the ratio
SE = strel('disk',10)%worked best with imclose
BWr = imclose(BWr, SE);%used this to make the bubbles solid
W = sum(BWr(:)); %the amount of white pixels in the image
ratio = W/numel(BWr);%the number of white pixels for every pixel in the image

end