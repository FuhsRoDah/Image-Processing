%%
%used a histogram to find a value of the location of the chicken bones on
%the spectrum. 
%Found that the image contained the clearest picture of the bones at 200.
%
function [BW, L, C] = Project3B_08(f)
%f = imread('P3imageB.tif');
BW = f>200;
se = strel('square',3);
BW = imerode(BW,se);
%subplot(1,2,1),imshow(f),subplot(1,2,2),imshow(BW)
CC = bwconncomp(BW);
L = labelmatrix(CC);
C = CC.Connectivity;
fprintf('The Chicken Breast has %d connected components.\n', C);

end

