function [BW] = ProjectF_08(I)

BW = im2bw(I); %the BW image that is used to find all of the data
%This gave me higher accuracies and fscores than using imbinarize.
%I was planning on using a threshold to get the accuracies and fscores
%closer to 1, but to get a 1 the BW image had to be black so I just stuck
%with using im2bw.

end