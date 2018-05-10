for i = 1:30
   v(:,:,i) = imread('train-volume.tif','Index',i); 
end
for j = 1:30
   w(:,:,j) = imread('train-labels.tif','Index',j); 
end

acctotal=0;%this will be a running total of the accuracy
fstotal=0;%this will be a running total of the f-scores
for n=1:30%cycles through the images
A=v(:,:,n);%the EM slice of the image at index n
B=w(:,:,n);%the binary label image at index n
B = logical(B);%converts the binary label image from uint8 to logical so you can do arithmetic
BW = im2bw(A);%converts A to a black and white logical image
BW = B - BW;%this is used to determine the FP because this is the difference between
%the binary label image and the logical EM slice
FP= sum(BW(:));%the FP is the number of pixels in your BW image that were 
%true when they were supposed to be false
total = numel(BW);%used later in the program to find the FN
TN =0;%True Negative
TP=0;%True Positive

%the loop below goes through every pixel in the images to compare if the
%pixels in each image were both true(1) or both false(0). If they were both
%false(0) then the true negative is incremented. If they are both true(1)
%then the true positive increases by 1.
for i=1:numel(BW)
    if BW(i)==0 && B(i)==0
      TN = TN+1;
    end
    if BW(i)==1 && B(i)==1
        TP = TP +1;
    end
end
FN = total-(TP+TN+FP);%The False Negative is found by subtracting the TP,TN
%and FP from the total amount of pixels in the image
ACC = (TP + TN)/total;%pixel accuracy
Fscore = (2*TP)/(2*TP + FP + FN);%F-score
fprintf('The ACC of image %d is %d. The Fscore is %d', n, ACC, Fscore);%I used
%this print statement to organize all of the data
acctotal = acctotal + ACC;%running total of accuracies
fstotal = fstotal + Fscore;%running total of the fscores
avgacc = acctotal/30;%average accuracy for the images
avgfs = fstotal/30;%average fscore for the images
end