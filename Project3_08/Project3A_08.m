%Project 3A


function [BW1, BW2] = Project3A_08(f)
%f=imread('P3imageA.tif');
f = im2double(f);


[fx,fy] = gradient(f);

BW1 = sqrt(fx.^2 + fy.^2);
BW1= imbinarize(BW1);    
    
se = strel('square',3);
fe = imerode(f,se);
de = imdilate(f,se);
BW2 = de - fe;
BW2 = imbinarize(BW2);%makes BW2 logical

%subplot(1,2,1), imshow(BW1), subplot(1,2,2), imshow(BW2)

end

